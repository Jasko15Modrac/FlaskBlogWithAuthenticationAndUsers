--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: blog_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blog_posts (
    id integer NOT NULL,
    author_id integer NOT NULL,
    title character varying(250) NOT NULL,
    subtitle character varying(250) NOT NULL,
    date character varying(250) NOT NULL,
    body text NOT NULL,
    img_url character varying(250) NOT NULL
);


ALTER TABLE public.blog_posts OWNER TO postgres;

--
-- Name: blog_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blog_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_posts_id_seq OWNER TO postgres;

--
-- Name: blog_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blog_posts_id_seq OWNED BY public.blog_posts.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    author_id integer,
    post_id integer,
    comment character varying(1000) NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    email character varying(250) NOT NULL,
    password character varying(1000) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: blog_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_posts ALTER COLUMN id SET DEFAULT nextval('public.blog_posts_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: blog_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blog_posts (id, author_id, title, subtitle, date, body, img_url) FROM stdin;
2	1	Netherlands set to further restrict semiconductor technology exports	Technology News	March 10, 2023	<p><a href="https://en.wikinews.org/wiki/Netherlands">Dutch</a>&nbsp;trade minister&nbsp;<a href="https://en.wikipedia.org/wiki/Liesje_Schreinemacher">Liesje Schreinemacher</a>&nbsp;wrote lawmakers yesterday announcing the government will detail additional curbs on exporting&nbsp;<a href="https://en.wikipedia.org/wiki/Integrated_circuit">semiconductor chip</a>&nbsp;technology &quot;on national security grounds&quot;.</p>\r\n\r\n<p>Her letter to the&nbsp;<a href="https://en.wikipedia.org/wiki/States_General_of_the_Netherlands">States General of the Netherlands</a>&nbsp;read in part: &quot;In view of technological developments and geopolitical context, the government has come to the conclusion that it is necessary for (inter)national security to extend the existing export control of specific&nbsp;<a href="https://en.wikipedia.org/wiki/Semiconductor_device_fabrication">semiconductor production</a>&nbsp;equipment [...]</p>\r\n\r\n<p>&quot;Because the Netherlands considers it necessary on national security grounds to get this technology into oversight with the greatest of speed, the&nbsp;<a href="https://en.wikipedia.org/wiki/Fourth_Rutte_cabinet">Cabinet</a>&nbsp;will introduce a national control list&quot;, to be published &quot;before the summer.&quot;</p>\r\n\r\n<p>The exact list of products affected were decided with &quot;surgical&quot; precision, &quot;in order to avoid unnecessary disruption of the value chains and to take into account the international level playing field.&quot;</p>\r\n\r\n<p>It comes after at least three months of negotiations with the&nbsp;<a href="https://en.wikinews.org/wiki/United_States">United States</a>, which unilaterally introduced expansive export restrictions in October to limit&nbsp;<a href="https://en.wikinews.org/wiki/China">Chinese</a>&nbsp;firms&#39; access to foreign chips and tools to make their own, due to fears of military application.</p>\r\n\r\n<p>US officials conceded, however, the measures&#39; efficacy would be reduced without international co-operation. The&nbsp;<em><a href="https://en.wikinews.org/wiki/Associated_Press">Associated Press</a></em>&nbsp;reported in January similar restrictions were agreed to by Dutch and&nbsp;<a href="https://en.wikinews.org/wiki/Japan">Japanese</a>&nbsp;functionaries when they visited&nbsp;<a href="https://en.wikinews.org/wiki/Washington,_D.C.">Washington, D.C.</a>&nbsp;for talks, with separate t&ecirc;te-&agrave;-t&ecirc;te discussions that month between US President&nbsp;<a href="https://en.wikinews.org/wiki/Joe_Biden">Joe Biden</a>&nbsp;and the nations&#39; prime ministers.</p>\r\n\r\n<p>Schreinemacher told reporters in&nbsp;<a href="https://en.wikinews.org/wiki/Brussels">Brussels</a>,&nbsp;<a href="https://en.wikinews.org/wiki/Belgium">Belgium</a>&nbsp;last November the Dutch government was &quot;having talks with the US&quot;, saying: &quot;We do share the concerns [the US government has] when it comes to China, when it comes to security&quot; and Dutch &quot;national security interest is of the utmost importance.&quot;</p>\r\n\r\n<p>Without commenting on the prospect of similar restrictions being introduced, the minister said the US export controls&#39; observed negative impact on Dutch companies were &quot;for the right reasons [...] national security interests.&quot;</p>\r\n\r\n<p><a href="https://en.wikipedia.org/wiki/Veldhoven">Veldhoven</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/North_Brabant">North Brabant</a>-based&nbsp;<a href="https://en.wikipedia.org/wiki/ASML_Holding">ASML Holding</a>,&nbsp;<a href="https://en.wikinews.org/wiki/Europe">Europe</a>&#39;s largest&nbsp;<a href="https://en.wikinews.org/wiki/Technology">technology</a>&nbsp;company, dominates the production of the&nbsp;<a href="https://en.wikipedia.org/wiki/laser">laser</a>&nbsp;<a href="https://en.wikipedia.org/wiki/Photolithography">lithography</a>&nbsp;systems necessary for computer chips; it has offices in&nbsp;<a href="https://en.wikinews.org/wiki/Beijing">Beijing</a>&nbsp;and&nbsp;<a href="https://en.wikinews.org/wiki/Shenzhen">Shenzhen</a>&nbsp;and a&nbsp;<a href="https://en.wikinews.org/wiki/Hong_Kong">Hong Kong</a>&nbsp;regional headquarters.</p>\r\n\r\n<p>The firm has reported about 16% of its 2021 sales, or over&nbsp;<a href="https://en.wikinews.org/wiki/Euro">&euro;</a>2 billion, were to China.</p>\r\n\r\n<p>Among products sold are advanced deep&nbsp;<a href="https://en.wikipedia.org/wiki/Ultraviolet">ultra violet</a>&nbsp;(DUV) systems, which were mentioned as affected by the new controls in Schreinemacher&#39;s letter as &quot;very specific technologies in the semiconductor production cycle on which the Netherlands has a unique and leading position&quot;.</p>\r\n\r\n<p>A statement on the company&#39;s website confirms &quot;ASML will need to apply for export licenses for shipment of the most advanced immersion DUV systems.&quot;</p>\r\n\r\n<p>However, it clarifies not all immersion lithography tools are affected, and states based on &quot;our expectation of the Dutch government&rsquo;s licensing policy, and the current market situation, we do not expect these measures to have a material effect on&quot; either its 2023 or long-term financial outlooks.</p>\r\n\r\n<p>This follows a November 11 assurance by CEO Peter Wennink that a scenario where Chinese chipmakers couldn&#39;t expand their capacity could mean a &quot;temporary hiccough&quot; but wouldn&#39;t &quot;change the 2030 picture that much&quot; because &quot;ultimately those chips need to be made.&quot;</p>\r\n\r\n<p>Its 2023 sales projection for China estimates near-zero growth to &euro;2.2 billion even as ASML expects overall sales to expand by 25%.</p>\r\n\r\n<p>Key questions remain, including whether ASML will be allowed to service the DUV machines already sold, and what precisely is affected&mdash;while Schreinemacher&#39;s letter mentions &quot;the most advanced [DUV] immersion lithography and deposition&quot;, it does not name ASML, who has interpreted &quot;most advanced&quot; to mean its &#39;critical immersion&#39; systems.</p>\r\n\r\n<p>Existing controls have prohibited ASML from supplying China chipmaking technology with their most advanced&nbsp;<a href="https://en.wikipedia.org/wiki/extreme_ultraviolet_lithography">extreme ultraviolet lithography</a>&nbsp;systems since 2019, of which they are the world&#39;s sole producers. These curbs were introduced following US fears they could be &#39;dual use&#39; with military potential.</p>\r\n\r\n<p>China has criticised restrictions as disrupting ordinary trade relations, its&nbsp;<a href="https://en.wikipedia.org/wiki/Ministry_of_Commerce_(China)">Ministry of Commerce</a>&nbsp;stating after Washington&#39;s initial announcement the US &quot;should stop the wrongdoings immediately and give fair treatment to companies from all over the world, including Chinese companies.&quot;</p>\r\n\r\n<p>Despite trading barbs, a&nbsp;<a href="https://en.wikipedia.org/wiki/United_States_Department_of_State">US State Department</a>&nbsp;spokesperson told&nbsp;<a href="https://en.wikipedia.org/wiki/CNBC">CNBC</a>&nbsp;that where &quot;China is pursuing asymmetric&nbsp;<a href="https://en.wikipedia.org/wiki/Decoupling_and_re-coupling#Economics">decoupling</a>&quot;, Secretary of State&nbsp;<a href="https://en.wikinews.org/wiki/Antony_Blinken">Antony Blinken</a>&nbsp;has &quot;said we do not want to sever China&rsquo;s economy from ours&quot;.</p>\r\n\r\n<p>Sources quoted by Reuters expect Japan to update its own export policies as soon as this week.</p>\r\n	https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/SMIC%EF%BC%8CShenzhen_Factory.jpg/330px-SMIC%EF%BC%8CShenzhen_Factory.jpg
3	1	Io (Jupiter's moon)	Celestial Objects	March 12, 2023	<p><strong>Io</strong>&nbsp;(<a href="https://en.wikipedia.org/wiki/Help:IPA/English">/ˈaɪ.oʊ/</a>), or&nbsp;<strong>Jupiter I</strong>, is the innermost and third-largest of the four&nbsp;<a href="https://en.wikipedia.org/wiki/Galilean_moons">Galilean moons</a>&nbsp;of the planet&nbsp;<a href="https://en.wikipedia.org/wiki/Jupiter">Jupiter</a>. Slightly larger than Earth&rsquo;s&nbsp;<a href="https://en.wikipedia.org/wiki/Moon">moon</a>, Io is the&nbsp;<a href="https://en.wikipedia.org/wiki/List_of_natural_satellites">fourth-largest moon</a>&nbsp;in the&nbsp;<a href="https://en.wikipedia.org/wiki/Solar_System">Solar System</a>, has the highest density of any moon, the strongest surface gravity of any moon, and the lowest amount of water (by&nbsp;<a href="https://en.wikipedia.org/wiki/Atomic_ratio">atomic ratio</a>) of any known&nbsp;<a href="https://en.wikipedia.org/wiki/Astronomical_object">astronomical object</a>&nbsp;in the Solar System. It was discovered in 1610 by&nbsp;<a href="https://en.wikipedia.org/wiki/Galileo_Galilei">Galileo Galilei</a>&nbsp;and was named after the mythological character&nbsp;<a href="https://en.wikipedia.org/wiki/Io_(mythology)">Io</a>, a priestess of&nbsp;<a href="https://en.wikipedia.org/wiki/Hera">Hera</a>&nbsp;who became one of&nbsp;<a href="https://en.wikipedia.org/wiki/Zeus">Zeus</a>&#39;s lovers.</p>\r\n\r\n<p>With over 400 active&nbsp;<a href="https://en.wikipedia.org/wiki/Volcano">volcanoes</a>, Io is the most geologically active object in the Solar System.<a href="https://en.wikipedia.org/wiki/Io_(moon)#cite_note-book-11">[11]</a><a href="https://en.wikipedia.org/wiki/Io_(moon)#cite_note-Lopes2004-12">[12]</a><a href="https://en.wikipedia.org/wiki/Io_(moon)#cite_note-NYT-20190626-13">[13]</a>&nbsp;This extreme geologic activity is the result of&nbsp;<a href="https://en.wikipedia.org/wiki/Tidal_heating_of_Io">tidal heating</a>&nbsp;from&nbsp;<a href="https://en.wikipedia.org/wiki/Friction">friction</a>&nbsp;generated within Io&#39;s interior as it is pulled between Jupiter and the other Galilean moons&mdash;<a href="https://en.wikipedia.org/wiki/Europa_(moon)">Europa</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Ganymede_(moon)">Ganymede</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Callisto_(moon)">Callisto</a>. Several volcanoes produce plumes of&nbsp;<a href="https://en.wikipedia.org/wiki/Sulfur">sulfur</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Sulfur_dioxide">sulfur dioxide</a>&nbsp;that climb as high as 500&nbsp;km (300&nbsp;mi) above the surface. Io&#39;s surface is also dotted with more than 100 mountains that have been uplifted by extensive compression at the base of Io&#39;s&nbsp;<a href="https://en.wikipedia.org/wiki/Silicate">silicate</a>&nbsp;crust. Some of these peaks are taller than&nbsp;<a href="https://en.wikipedia.org/wiki/Mount_Everest">Mount Everest</a>, the highest point on&nbsp;<a href="https://en.wikipedia.org/wiki/Earth">Earth&#39;s</a>&nbsp;surface.<a href="https://en.wikipedia.org/wiki/Io_(moon)#cite_note-Schenk2001-14">[14]</a>&nbsp;Unlike most moons in the outer Solar System, which are mostly composed of water&nbsp;<a href="https://en.wikipedia.org/wiki/Ice">ice</a>, Io is primarily composed of&nbsp;<a href="https://en.wikipedia.org/wiki/Silicate">silicate</a>&nbsp;rock surrounding a molten&nbsp;<a href="https://en.wikipedia.org/wiki/Iron">iron</a>&nbsp;or&nbsp;<a href="https://en.wikipedia.org/wiki/Pyrite">iron sulfide</a>&nbsp;core. Most of Io&#39;s surface is composed of extensive plains with a frosty coating of&nbsp;<a href="https://en.wikipedia.org/wiki/Sulfur">sulfur</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Sulfur_dioxide">sulfur dioxide</a>.</p>\r\n\r\n<p>Io&#39;s volcanism is responsible for many of its unique features. Its volcanic plumes and lava flows produce large surface changes and paint the surface in various subtle shades of yellow, red, white, black, and green, largely due to&nbsp;<a href="https://en.wikipedia.org/wiki/Allotropes_of_sulfur">allotropes</a>&nbsp;and compounds of sulfur. Numerous extensive lava flows, several more than 500&nbsp;km (300&nbsp;mi) in length, also mark the surface. The materials produced by this volcanism make up Io&#39;s thin, patchy atmosphere and Jupiter&#39;s extensive&nbsp;<a href="https://en.wikipedia.org/wiki/Magnetosphere_of_Jupiter">magnetosphere</a>. Io&#39;s volcanic ejecta also produce a large&nbsp;<a href="https://en.wikipedia.org/wiki/Gas_torus">plasma torus</a>&nbsp;around Jupiter.</p>\r\n\r\n<p>Io played a significant role in the development of astronomy in the 17th and 18th centuries; discovered in January 1610 by&nbsp;<a href="https://en.wikipedia.org/wiki/Galileo_Galilei">Galileo Galilei</a>, along with the other&nbsp;<a href="https://en.wikipedia.org/wiki/Galilean_satellites">Galilean satellites</a>, this discovery furthered the adoption of the&nbsp;<a href="https://en.wikipedia.org/wiki/Heliocentrism">Copernican model</a>&nbsp;of the Solar System, the development of&nbsp;<a href="https://en.wikipedia.org/wiki/Johannes_Kepler">Kepler&#39;s</a>&nbsp;laws of motion, and&nbsp;<a href="https://en.wikipedia.org/wiki/R%C3%B8mer%27s_determination_of_the_speed_of_light">the first measurement of the speed of light</a>. Viewed from Earth, Io remained just a point of light until the late 19th and early 20th centuries, when it became possible to resolve its large-scale surface features, such as the dark red polar and bright equatorial regions. In 1979, the two&nbsp;<em><a href="https://en.wikipedia.org/wiki/Voyager_program">Voyager</a></em>&nbsp;spacecraft revealed Io to be a geologically active world, with numerous volcanic features, large mountains, and a young surface with no obvious impact craters. The&nbsp;<em><a href="https://en.wikipedia.org/wiki/Galileo_(spacecraft)">Galileo</a></em>&nbsp;spacecraft performed several close flybys in the 1990s and early 2000s, obtaining data about Io&#39;s interior structure and surface composition. These spacecraft also revealed the relationship between Io and Jupiter&#39;s&nbsp;<a href="https://en.wikipedia.org/wiki/Magnetosphere">magnetosphere</a>&nbsp;and the existence of a belt of high-energy radiation centered on Io&#39;s orbit. Io receives about 3,600&nbsp;<a href="https://en.wikipedia.org/wiki/R%C3%B6ntgen_equivalent_man">rem</a>&nbsp;(36&nbsp;<a href="https://en.wikipedia.org/wiki/Sievert">Sv</a>) of&nbsp;<a href="https://en.wikipedia.org/wiki/Ionizing_radiation">ionizing radiation</a>&nbsp;per day.<a href="https://en.wikipedia.org/wiki/Io_(moon)#cite_note-15">[15]</a></p>\r\n\r\n<p>Further observations have been made by&nbsp;<em><a href="https://en.wikipedia.org/wiki/Cassini%E2%80%93Huygens">Cassini&ndash;Huygens</a></em>&nbsp;in 2000,&nbsp;<em><a href="https://en.wikipedia.org/wiki/New_Horizons">New Horizons</a></em>&nbsp;in 2007, and&nbsp;<em><a href="https://en.wikipedia.org/wiki/Juno_(spacecraft)">Juno</a></em>&nbsp;since 2017, as well as from&nbsp;<a href="https://en.wikipedia.org/wiki/Earth">Earth</a>-based&nbsp;<a href="https://en.wikipedia.org/wiki/Telescope">telescopes</a>&nbsp;and the&nbsp;<a href="https://en.wikipedia.org/wiki/Hubble_Space_Telescope">Hubble Space Telescope</a>.</p>\r\n	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Io_highest_resolution_true_color.jpg/330px-Io_highest_resolution_true_color.jpg
4	1	FC Barcelona and former club presidents charged with ‘continued corruption’ relating to alleged improper payments	Football	March 12, 2023	<p><cite>&nbsp;</cite></p>\r\n\r\n<p><a href="http://www.cnn.com/2023/03/04/football/ronaldinho-son-joao-mendes-barcelona-academy-spt-intl/index.html" target="_blank">FC Barcelona</a>&nbsp;was charged on Friday by the Barcelona provincial prosecutor&rsquo;s office with &ldquo;continued corruption between individuals in the sports field&rdquo; in addition to other charges in relation to an alleged payment scandal which has rocked Spanish&nbsp;<a href="http://www.cnn.com/2023/03/10/football/manchester-united-real-betis-bruno-fernandes-spt-intl/index.html" target="_blank">soccer</a>.</p>\r\n\r\n<p>Former&nbsp;<a href="http://www.cnn.com/2023/02/21/football/barcelona-laporta-referee-scandal-payment-laliga-spt-intl/index.html" target="_blank">FCB presidents</a>&nbsp;Sandro Rosell and Josep Maria Bartomeu, former club CEO Oscar Grau, former club director of professional sports Albert Soler and Jos&eacute; Mar&iacute;a Enr&iacute;quez Negreira &ndash; a former leading refereeing official in Spain &ndash; have also been charged.</p>\r\n\r\n<p>In a written complaint from the Barcelona Prosecutor&rsquo;s Office sent to CNN, Bar&ccedil;a and the other accused have also been charged with &ldquo;the crime of continued false administration and the crime of continued falsification of commercial documents.&rdquo;</p>\r\n\r\n<p>The charges were presented to the No. 1 magistrate&rsquo;s court in Barcelona.</p>\r\n\r\n<p>An FCB source told CNN that the club did not have an official statement, though its first reaction was that the charges were to be expected after recent events, but that the report was an &ldquo;absolutely preliminary investigative hypothesis&rdquo; and that the club would assist the investigation in any way possible. The source also strongly denied that the club had at any time bribed a referee or tried to influence refereeing decisions.</p>\r\n\r\n<p>Spanish lawyer Jose Maria Fuster Fabra confirmed to CNN that he&rsquo;s representing&nbsp;<a href="http://www.cnn.com/2022/10/18/football/neymar-court-barcelona-transfer-intl-spt/index.html" target="_blank">Bartomeu</a>&nbsp;in this case. &ldquo;We are preparing the defense and we don&rsquo;t think this case will go to trial,&rdquo; he said, declining to make further statements.</p>\r\n\r\n<p>CNN has reached out to Enriquez Negreira&rsquo;s company for comment.</p>\r\n\r\n<p>CNN was unable to contact Rosell, Grau and Soler for comment.</p>\r\n\r\n<p><img alt="" src="https://media.cnn.com/api/v1/images/stellar/prod/230310110517-sandro-rosell.jpg?c=16x9&amp;q=h_720,w_1280,c_fill" style="height:720px; width:1280px" /></p>\r\n\r\n<p>According to the Prosecutor&rsquo;s Office, the accused held positions of power in the club and were aware of payments which were invoiced annually from January 2011 until June 2018 to two companies that Enr&iacute;quez Negreira &ndash; who was serving as a CTA vice president from 1993 to 2018 &ndash; founded, which &ldquo;acted on behalf and in direct benefit to Barcelona.&rdquo;</p>\r\n\r\n<p>The CTA is the governing body responsible for deciding which referees and assistants officiate league and national competitive matches in Spain.</p>\r\n\r\n<p>The club is accused of &ndash; through both Rosell and Bartomeu &ndash; coming to a &ldquo;strictly confidential verbal agreement&rdquo; with Enr&iacute;quez Negreira with the aim to &ldquo;produce actions which tended to favor Barcelona in the form of refereeing decisions.&rdquo;</p>\r\n\r\n<p>&ldquo;Subsequently, the companies of the accused, [Nisdal SCP] and [Dasnil 95 SL], produced invoices which were presented for payment to FCB without having to produce any services of real technical reports,&rdquo; the report said.</p>\r\n\r\n<p>The report from the Barcelona&rsquo;s Prosecutor&rsquo;s Office outlines that the two companies connected to Enr&iacute;quez Negreira were founded by him and he held 100% and 95% of the shares in Dasnil 95 and Nisdal respectively.</p>\r\n\r\n<p>According to the report, an audit was started by the tax authorities in 2019 into Enr&iacute;quez Negreira&rsquo;s companies in which they asked Barcelona to provide copies of invoices and method of payment. Because Barcelona was not able to satisfy the authorities&rsquo; questions, the club incurred a tax penalty and an investigation was later opened into Enr&iacute;quez Negreira and his companies for the time period of 2016 to 2019.</p>\r\n\r\n<p>The investigation discovered that the club paid his two companies a total of $3,175,589.21 (&euro;2,971,673.01) between those years, mostly under the pretense of &ldquo;assessment of technical videos.&rdquo; After Enr&iacute;quez Negreira was relieved of his vice presidency at the CTA in 2018, the payments from Barcelona stopped.</p>\r\n\r\n<p><img alt="" src="https://media.cnn.com/api/v1/images/stellar/prod/230310110515-josep-maria-bartomeu.jpg?c=16x9&amp;q=h_720,w_1280,c_fill" style="height:720px; width:1280px" /></p>\r\n\r\n<p>In February 2019, Enr&iacute;quez Negreira sent a fax directed towards Bartomeu &ldquo;recriminating him for ending the long-lasting relationship, insisting that a solution be found for both parties and warning him of the consequences of not doing so,&rdquo; according to the report.</p>\r\n\r\n<p>&ldquo;I don&rsquo;t have the will to give attention to all of the irregularities I&rsquo;ve known and lived first-hand with anyone at the Club, but you are forcing me to do so if you don&rsquo;t reconsider your decision and complete the agreement we had to continue using my services until the end of my presidential mandate,&rdquo; Enr&iacute;quez Negreira wrote.</p>\r\n\r\n<p>According to the report, the total amount Bar&ccedil;a paid Enr&iacute;quez Negreira&rsquo;s companies from 2001 to 2018 during his vice-presidency in the CTA surpassed $7.8 million (&euro;7.3 million).</p>\r\n\r\n<p>&ldquo;This resulted in a substantial remuneration, unforeseen by the statutes of the Club nor which was approved by the General Assembly, which should have been given its nature. Definitively, said payments neither had legal or statutory support at all.&rdquo;</p>\r\n\r\n<p>In February, Barcelona said that a &ldquo;thorough and independent investigation&rdquo; was underway.</p>\r\n\r\n<p>European football governing body UEFA declined to comment on whether it is investigating the club. However, in a press conference earlier in March, Spanish football federation (RFEF) secretary general Andreu Camps said the organization had sent all of its information relating to the case to UEFA&rsquo;s integrity unit.</p>\r\n\r\n<p>CNN has reached out to FIFA for comment.</p>\r\n	https://media.cnn.com/api/v1/images/stellar/prod/230216150143-01-barcelona-investigation.jpg?c=16x9&q=h_720,w_1280,c_fill
5	1	Coffee and green tea may lower death risk for some adults	Health	March 12, 2023	<p>Coffee and tea are two of the most consumed beverages on the planet. Coffee is the second most traded commodity in the world. They are both enjoyed by billions of people for various reasons, and an increasing number of studies suggest they are good for you.</p>\r\n\r\n<p>Recently, another study attesting to the health benefits of these drinks was published in Japan. A several-year review of the health and dietary habits of nearly 5,000 type 2 diabetics shows that those who drink more coffee and tea can enjoy a dramatically reduced death rate.</p>\r\n\r\n<p>The&nbsp;<a href="https://drc.bmj.com/content/8/1/e001252?T=AU" target="_blank">study</a>&nbsp;involved 4,923 type 2 diabetics living in Japan. The average participant was 66 years old. All of the participants were taken from the rolls of the Fukuoka Diabetes Registry, a study geared at learning about the effects of new treatments and lifestyle changes on the health of diabetics.</p>\r\n\r\n<p>The participants filled out questionnaires concerning their health, diet, habits, and other factors. Among the questions were two focused on determining how much green tea or coffee, if any, the participants consumed over the course of a week. The health of the participants was recorded for five years. During this time, 309 of the test subjects died from a variety of causes.</p>\r\n\r\n<p>Subjects who drank more than one cup of tea or coffee per day demonstrated lower odds of dying than those who had none. Those who consumed the most tea and coffee, more than four and two cups a day, respectively, enjoyed the most significant reductions in their risk of death. This level of consumption was associated with a 40 percent lower risk of&nbsp;<a href="https://www.sciencedaily.com/releases/2020/10/201020190129.htm" target="_blank">death</a>.</p>\r\n\r\n<p>Most interestingly, the effects of drinking tea and coffee appear to combine to reduce risk even further. Those who reported drinking two or three cups of tea a day and two or more cups of coffee were 51 percent less likely to die during the study, while those who drank a whopping four or more cups of tea and two or more cups of coffee had a 63 percent lower risk of&nbsp;<a href="https://www.medicalnewstoday.com/articles/diabetes-coffee-and-green-tea-might-reduce-death-risk" target="_blank">death</a>.</p>\r\n\r\n<p>Not quite.</p>\r\n\r\n<p>The primary takeaway from this study is that Japanese adults with type 2 diabetes who drink a lot of green tea and/or coffee die less often than similar people who do not. If this effect is caused by something in the drink, lifestyle choices people who drink that much tea all make, or something else remains unknown. The finding must be considered an association at this point.</p>\r\n\r\n<p>The eye-popping reductions in mortality rates are compared to the risk of death of others in the study. The people who died reported drinking less tea and coffee than those who lived. Unless you have several demographic and conditional similarities to the subjects of this study, you probably won&rsquo;t suddenly be at a two-thirds lower risk of death than your peers because you drink green tea.</p>\r\n\r\n<p>Like all studies that depend on self-reporting, it is also possible that people misstated how much they consumed any one item. The study also did not look into other factors like socioeconomic status or education level, also known to impact death rates and potentially linked to coffee and tea consumption.</p>\r\n\r\n<p>However, it is yet another study in the pile that suggests that&nbsp;<a href="https://www.healthline.com/nutrition/top-13-evidence-based-health-benefits-of-coffee" target="_blank">coffee</a>&nbsp;and&nbsp;<a href="https://www.healthline.com/nutrition/top-10-evidence-based-health-benefits-of-green-tea" target="_blank">green tea</a>&nbsp;are good for you. That much is increasingly&nbsp;<a href="https://www.health.harvard.edu/press_releases/health-benefits-linked-to-drinking-tea" target="_blank">agreed</a><a href="https://www.rush.edu/health-wellness/discover-health/health-benefits-coffee" target="_blank">&nbsp;upon</a>. This study also suggests the benefits are additive, which is a new development.</p>\r\n\r\n<p>So, while it isn&rsquo;t time to start the IV drip of green tea, a cup or two probably won&rsquo;t&nbsp;<a href="https://www.webmd.com/diabetes/news/20201022/coffee-green-tea-might-extend-life-for-folks-with-type-2-diabetes" target="_blank">hurt</a>.</p>\r\n	https://bigthink.com/wp-content/uploads/2020/10/origin-31.jpg?resize=640,360
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, author_id, post_id, comment) FROM stdin;
1	1	2	<p>Great article</p>\r\n
2	2	4	<p>Shamefull conduct by the club and its representatives.</p>\r\n
3	3	2	<p>This is a huge blow to China</p>\r\n
4	4	5	<p>I knew it!</p>\r\n
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
1	Olaf	testmail@gmail.com	pbkdf2:sha256:260000$91rYTs73$db5db961b1ea72fda5397929820f3cd1213a15d1220ed7951d2e6beb18abfdc0
2	Hansel	testmail1@gmail.com	pbkdf2:sha256:260000$1eFpgGJm$2821c0a2fe1c0f79ded74593d8f0e12b1a29c50c393b4c68a1cc50ad338bb5c8
3	Gretsel	testmail2@gmail.com	pbkdf2:sha256:260000$PjAlmShp$639aa08726ebe26aea0d4ccd0cb7006140f163457539d87ea6881bf78446be8b
4	Jack Sparrow	testmail3@gmail.com	pbkdf2:sha256:260000$sqZWnPhl$cd224dd0392d2cccbd2be7b0f4bf5d517ef6d69bcfe1f96ec8932fbb7981c5f3
\.


--
-- Name: blog_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blog_posts_id_seq', 5, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: blog_posts blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (id);


--
-- Name: blog_posts blog_posts_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_title_key UNIQUE (title);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: blog_posts blog_posts_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- Name: comments comments_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.blog_posts(id);


--
-- PostgreSQL database dump complete
--

