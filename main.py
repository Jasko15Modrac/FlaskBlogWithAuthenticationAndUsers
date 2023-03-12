from flask import Flask, render_template, redirect, url_for, flash, request, abort
from flask_bootstrap import Bootstrap
from flask_ckeditor import CKEditor
from datetime import date
from werkzeug.security import generate_password_hash, check_password_hash
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin, login_user, LoginManager, login_required, current_user, logout_user
from forms import CreatePostForm, RegisterForm, LoginForm, CommentForm
from sqlalchemy.exc import IntegrityError
import functools
import os
import psycopg2


app = Flask(__name__)
app.config['SECRET_KEY'] = os.getenv("MY_SECRET_KEY")
ckeditor = CKEditor(app)

Bootstrap(app)

##CONNECT TO DB

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://application:ow4nkPWMBh0rKdrR04WITcvcADUky8Z3@dpg-cg6t4hhmbg5ab7luhct0-a/appdatabase_tc88'

db = SQLAlchemy(app)

login_manager = LoginManager()
login_manager.init_app(app)


##CONFIGURE TABLES

# Create a BLogPost model for table in database, We have also created relationship one-to-many between this and users
# table, and this and comments table. Where one user can have many posts associated with it and one post can have many
# comments associated with it. To achieve this we use ForeignKey where ForeignKey is the id of the user from users table
# The body column is of type Text which means it can store large amounts of data. We also have
# author = db.relationship('User', backref='posts'), this means that you now can list all posts that are related with
# that particular users via author.posts, you can also get a name of the author of the post via post.author.name.
# This relationship allows you to easily retrieve all the blog posts associated with a particular user.
# The backref='posts' option creates a virtual attribute on the User class that allows you to access all the blog posts
# associated with a particular user by using the user.posts syntax.
class BlogPost(db.Model):
    __tablename__ = "blog_posts"
    id = db.Column(db.Integer, primary_key=True)
    author_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)
    title = db.Column(db.String(250), unique=True, nullable=False)
    subtitle = db.Column(db.String(250), nullable=False)
    date = db.Column(db.String(250), nullable=False)
    body = db.Column(db.Text, nullable=False)
    img_url = db.Column(db.String(250), nullable=False)

    # Establish a relationship with the Users class
    author = db.relationship('User', backref='posts')


# This is the model of table in database called users. It has inherited from Model class which means its SQLAlchemy
# model of table, and has also inherited from the flask_logn class UserMixin which means it now has some functionalities
# that are needed for handling authentication, sessions, etc.
class User(db.Model, UserMixin):
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(250), nullable=False)
    email = db.Column(db.String(250), nullable=False, unique=True)
    password = db.Column(db.String(1000), nullable=False)


# This is the Comment SQLALchemy model for the table called comments in sqlite database. It has one-to-many-relationship
# with both users and blog_posts tables. Where one user can have many comments and one blog post can have many comments
# associated with it. We use the same db.relationship to establish the relationship between tables
class Comment(db.Model):
    __tablename__ = "comments"
    id = db.Column(db.Integer, primary_key=True)
    author_id = db.Column(db.Integer, db.ForeignKey("users.id"))
    post_id = db.Column(db.Integer, db.ForeignKey("blog_posts.id"))
    comment = db.Column(db.String(1000), nullable=False)

    author = db.relationship("User", backref="comments")
    post = db.relationship("BlogPost", backref="comments")


# Load user is a callback function that is used by the Flask-Login extension to load a user from the database given
# their ID. It takes a user_id parameter, which is the ID of the user to be loaded, and returns the User object
# corresponding to that ID. When a user is authenticated, user object is passed to login_user function, this function
# gets table ID of that object and converts it to string session ID and encrypts it using the flask app secret key you
# provided at the start of the app (app.config['SECRET_KEY'] = '8BYkEfBA6O6donzWlSihBXox7C0sKR6b'). This key is then
# stored inside session cookie. When you later on during session need current user object from database to do something
# with it, this function load_user() fetches ID from that session cookie, decrypts it and converts it to integer. This
# id now equals to the ID of the user object in table, therefore this function queries database and fetches and returns
# that object. Therefore, whenever we need to work with the table object of the currently logged-in user we can use
# current_user - this is a global object provided by the Flask-Login, and it represents currently logged-in user.


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


# This is the decorator function. Its purpose is to provide security layer to other view functions. Applying this
# function as a decorator to view functions will make them and html pages the render visible only to the person that has
# admin role. functools.wraps is a decorator that preserves original function metadata (e.g., name, docstring, etc.)
# when we wrapp it inside another function. This means that a decorated function has same attributes and functionalities
# as the original function. Here admin_only decorator function takes function as an argument, that is the function to
# be decorated. That decorated function is basically that function we passed as an argument but wrapped inside
# admin_only function. We used *args and **kwargs to let Python know that this function can accept any number of
# positional and keyword arguments. We do this because this decorator will decorate more than one view function,
# therefore we don't know how many arguments those functions might have. So by defining decorator function with
# *args and **kwargs we make it flexible and ensure it can be applied to any function. If the user is authenticated and
# if user's id is equal to one it returns original function with its original functionality. If that is not the case it
# uses Flask's web framework abort() function that displays error. Finally admin_only returns the decorated function
# which is the closure that "remembers" the original function func and the 403 Forbidden error message.

def admin_only(func):
    @functools.wraps(func)
    def decorated(*args, **kwargs):
        if not current_user.is_authenticated or current_user.id != 1:
            abort(403, "Access denied!")
        return func(*args, **kwargs)

    return decorated


# The view function that renders all blog posts to the homepage. The reason we have authentication logic to determine
# if user is authenticated and if user is admin is because we have options on the index.html that should only be visible
# to admin like Create New Post option.
@app.route('/')
def get_all_posts():
    posts = BlogPost.query.all()
    if current_user.is_authenticated:
        is_admin = current_user.id
    else:
        is_admin = 0
    return render_template("index.html", all_posts=posts, logged_in=current_user.is_authenticated,
                           is_admin=is_admin)


# This function is used to render form in the register.html page and to collect data from the submitted form and store
# it inside users table inside database. It uses werkzeug.security function generate_password_hash to encrypt password
# before sending it do table. method="pbkdf2:sha256" is a popular encrypting algorithm while salt_length = 8 means that
# 8 different random string will be added to the original password and encrypted.
@app.route('/register', methods=["GET", "POST"])
def register():
    form = RegisterForm()
    if request.method == "POST" and form.validate_on_submit():
        email = form.email.data
        password = generate_password_hash(form.password.data, method="pbkdf2:sha256", salt_length=8)
        name = form.name.data
        new_user = User(email=email, password=password, name=name)
        with app.app_context():
            with db.session.begin():
                try:
                    db.session.add(new_user)
                    db.session.commit()
                except IntegrityError:
                    db.session.rollback()
                    flash("You have already register with this email. Try to log in ")
                    return redirect(url_for("login"))

        return redirect(url_for("get_all_posts"))
    else:
        return render_template("register.html", form=form)


# Login view function renders login form to the login.html page and fetches data when that form is submitted. It uses
# email that the user entered to find if that email exist in the database and to instantiate that user object from
# database if it exists. If it doesn't exist the user is redirected to register.html and shown a message that he needs
# to register first. When we determine that the user exists the user object from tabel is instantiated and passed to a
# login_user function. This function logs-in user to session and fetches table user ID from user object converts it to a
# string encrypts it and stores it in a session cookie. This ID will later on be accessed by load_user callback function
# whenever we need to do something with that object. This is also explained above with load_user function.
@app.route('/login', methods=["GET", "POST"])
def login():
    form = LoginForm()
    if request.method == "POST" and form.validate_on_submit():
        user_email = form.email.data
        existing_user = User.query.filter_by(email=user_email).first()
        if existing_user:
            if check_password_hash(existing_user.password, form.password.data):
                login_user(existing_user)
                return redirect(url_for("get_all_posts"))
            else:
                flash("Incorrect password. Try again.")
                return render_template("login.html", form=form)
        else:
            flash("This user doesn't exist. Try to register first.")
            return redirect(url_for("register"))
    else:
        return render_template("login.html", form=form)


# This function logs out user and ends session it redirects to a login.html
@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('login'))


# This function renders a blog post page it fetches the particular post from database based on the post_id that is
# passed. It also fetches  and renders all the comments from comments table that are connected to that post. This
# function also renders comment form that allows users to post their comments to the current post. When the form is
# submitted the comments are saved to the comments table in database
@app.route("/post/<int:post_id>", methods=["GET", "POST"])
def show_post(post_id):
    form = CommentForm()
    requested_post = BlogPost.query.get(post_id)
    users_comments = Comment.query.filter_by(post_id=requested_post.id).all()
    if request.method == "POST" and form.validate_on_submit():
        if current_user.is_authenticated:
            with app.app_context():
                new_comment = Comment(comment=form.comment.data, author_id=current_user.id, post_id=requested_post.id)
                db.session.add(new_comment)
                db.session.commit()

            is_admin = current_user.id
        else:
            is_admin = 0
        return redirect(url_for("show_post", post_id=requested_post.id))
    else:
        if current_user.is_authenticated:
            is_admin = current_user.id
        else:
            is_admin = 0
        return render_template("post.html", post=requested_post, is_admin=is_admin,
                               logged_in=current_user.is_authenticated, form=form, users_comments=users_comments,
                               req_post_id=requested_post.id)


# This function renders about.html page
@app.route("/about")
def about():
    return render_template("about.html")


# This function renders contact.html page. You can only access the contact.html if you are logged in, that is because of
# Flask-Login @login_required decorator
@app.route("/contact", methods=["GET", "POST"])
@login_required
def contact():
    return render_template("contact.html")


# This function renders create post form to make-post.html. And it also fetches data from that form when its submited,
# creates new post and stores it inside the table blog_posts in database. It can only be accessed by admin.
@app.route("/new-post", methods=["GET", "POST"])
@admin_only
@login_required
def add_new_post():
    form = CreatePostForm()
    if form.validate_on_submit():
        if current_user.is_authenticated:
            new_post = BlogPost(
                author_id=current_user.id,
                title=form.title.data,
                subtitle=form.subtitle.data,
                body=form.body.data,
                img_url=form.img_url.data,
                date=date.today().strftime("%B %d, %Y")
            )
            with app.app_context():
                db.session.add(new_post)
                db.session.commit()
                return redirect(url_for("get_all_posts"))
        else:
            abort(403, "Access denied!")

    return render_template("make-post.html", form=form)


# This function is used to edit existing post. When you are on the html page of particular post and click edit button
# this function will take id of that post and using it fetch and instantiate corresponding post object from blog-posts
# table in database and populate edit form with the data and render that form to the "make-post.html" page for you to
# edit or change what you want. When you change data and submit that form the existing data in columns of that post in
# table will be updated with new values that you have entered.
@app.route("/edit-post/<int:post_id>", methods=["GET", "POST"])
@admin_only
@login_required
def edit_post(post_id):
    with app.app_context():
        post = BlogPost.query.get(post_id)
        edit_form = CreatePostForm(obj=post)
        if request.method == "POST":
            if edit_form.validate_on_submit():
                    post = BlogPost.query.get(post_id)
                    post.title = edit_form.title.data
                    post.subtitle = edit_form.subtitle.data
                    post.img_url = edit_form.img_url.data
                    post.body = edit_form.body.data
                    try:
                        db.session.commit()
                        flash('Post successfully updated!', 'success')
                        return redirect(url_for("show_post", post_id=post.id))
                    except Exception as e:
                        db.session.rollback()
                        flash('Error updating post: {}'.format(str(e)), 'danger')
                    return redirect(url_for("show_post", post_id=post.id))
            else:
                flash('Form validation errors: {}'.format(edit_form.errors), 'danger')
        return render_template("make-post.html", form=edit_form, logged_in=current_user.is_authenticated, is_edit=True)


# This function deletes post from table in database. It can only be accessed by admin.
@app.route("/delete/<int:post_id>")
@admin_only
@login_required
def delete_post(post_id):
    with app.app_context():
        post_to_delete = BlogPost.query.get(post_id)
        db.session.delete(post_to_delete)
        db.session.commit()
        return redirect(url_for('get_all_posts'))


if __name__ == "__main__":
    app.run(debug=True)
