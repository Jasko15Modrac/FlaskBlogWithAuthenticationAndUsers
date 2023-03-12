from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField
from wtforms.validators import DataRequired, URL, Email, ValidationError
from flask_ckeditor import CKEditorField
from email_validator import validate_email, EmailNotValidError


##WTForm
class CreatePostForm(FlaskForm):
    title = StringField("Blog Post Title", validators=[DataRequired()])
    subtitle = StringField("Subtitle", validators=[DataRequired()])
    img_url = StringField("Blog Image URL", validators=[DataRequired(), URL()])
    body = CKEditorField("Blog Content", validators=[DataRequired()])
    submit = SubmitField("Submit Post")


class RegisterForm(FlaskForm):

    def validate_email_address(self, email):
        try:
            validate_email(email.data)
        except EmailNotValidError as e:
            raise ValidationError(str(e))

    email = StringField("Email", validators=[DataRequired(), validate_email_address])
    password = PasswordField("Password", validators=[DataRequired()])
    name = StringField("Name", validators=[DataRequired()])
    submit = SubmitField("SIGN ME UP!")


class LoginForm(FlaskForm):

    def validate_email_address(self, email):
        try:
            validate_email(email.data)
        except EmailNotValidError as e:
            raise ValidationError(str(e))

    email = StringField("Email", validators=[DataRequired(), validate_email_address])
    password = PasswordField("Password", validators=[DataRequired()])
    submit = SubmitField("Login")


class CommentForm(FlaskForm):
    comment = CKEditorField("Comment", validators=[DataRequired()])
    submit_comment = SubmitField("Submit Comment")