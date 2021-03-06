PGDMP     (    +                x           d5uhjf5jth5qko     12.3 (Ubuntu 12.3-1.pgdg16.04+1)    12.2 X    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25985320    d5uhjf5jth5qko    DATABASE     �   CREATE DATABASE d5uhjf5jth5qko WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d5uhjf5jth5qko;
                dzmfrgrrkgatqc    false            �           0    0    DATABASE d5uhjf5jth5qko    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE d5uhjf5jth5qko FROM PUBLIC;
                   dzmfrgrrkgatqc    false    4014            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO dzmfrgrrkgatqc;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   dzmfrgrrkgatqc    false    3            �           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO dzmfrgrrkgatqc;
                   postgres    false    691            �            1259    30048785    colegiaturas    TABLE     �  CREATE TABLE public.colegiaturas (
    colegiatura_id integer NOT NULL,
    estudiante_id integer NOT NULL,
    monto numeric(8,2) DEFAULT 0,
    maximo numeric(8,2) DEFAULT 0,
    fecha character varying(50),
    mes character varying(50),
    status character(2),
    ciclo character varying(50) DEFAULT '2019-2020'::character varying,
    CONSTRAINT colegiaturas_status_check CHECK (((status = 'P'::bpchar) OR (status = 'SP'::bpchar) OR (status = 'A'::bpchar)))
);
     DROP TABLE public.colegiaturas;
       public         heap    dzmfrgrrkgatqc    false            �            1259    30048783    colegiaturas_colegiatura_id_seq    SEQUENCE     �   CREATE SEQUENCE public.colegiaturas_colegiatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.colegiaturas_colegiatura_id_seq;
       public          dzmfrgrrkgatqc    false    218            �           0    0    colegiaturas_colegiatura_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.colegiaturas_colegiatura_id_seq OWNED BY public.colegiaturas.colegiatura_id;
          public          dzmfrgrrkgatqc    false    217            �            1259    25997736 
   estudiante    TABLE     �  CREATE TABLE public.estudiante (
    estudiante_id integer NOT NULL,
    curp character varying(200),
    nombre character varying(100) NOT NULL,
    apellido_pat character varying(100) NOT NULL,
    apellido_mat character varying(100),
    grado character varying(5) NOT NULL,
    edad integer NOT NULL,
    nombre_tutor character varying(50),
    telefono_casa character varying(50),
    telefono_celular character varying(50),
    correo_electronico character varying(50),
    passwords character varying(255),
    dia_registro character varying(255),
    estado character(2),
    ingresos_pltaforma integer DEFAULT 0,
    CONSTRAINT estado_ck CHECK ((estado = ANY (ARRAY['A'::bpchar, 'S'::bpchar, 'B'::bpchar])))
);
    DROP TABLE public.estudiante;
       public         heap    dzmfrgrrkgatqc    false            �            1259    29807582    ingreso_plataforma_estudiante    TABLE     �   CREATE TABLE public.ingreso_plataforma_estudiante (
    ingreso_plataforma_estudiante_id integer NOT NULL,
    estudiante_id integer NOT NULL,
    num_ing integer NOT NULL,
    fecha_ingreso character varying(90)
);
 1   DROP TABLE public.ingreso_plataforma_estudiante;
       public         heap    dzmfrgrrkgatqc    false            �            1259    29807580 ?   ingreso_plataforma_estudiante_ingreso_plataforma_estudiante_seq    SEQUENCE     �   CREATE SEQUENCE public.ingreso_plataforma_estudiante_ingreso_plataforma_estudiante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.ingreso_plataforma_estudiante_ingreso_plataforma_estudiante_seq;
       public          dzmfrgrrkgatqc    false    210            �           0    0 ?   ingreso_plataforma_estudiante_ingreso_plataforma_estudiante_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.ingreso_plataforma_estudiante_ingreso_plataforma_estudiante_seq OWNED BY public.ingreso_plataforma_estudiante.ingreso_plataforma_estudiante_id;
          public          dzmfrgrrkgatqc    false    209            �            1259    29807608 $   ingreso_plataforma_prof_especialista    TABLE     �   CREATE TABLE public.ingreso_plataforma_prof_especialista (
    ingreso_plataforma_prof_e_id integer NOT NULL,
    profesor_id integer NOT NULL,
    num_ing integer NOT NULL,
    fecha_ingreso character varying(90)
);
 8   DROP TABLE public.ingreso_plataforma_prof_especialista;
       public         heap    dzmfrgrrkgatqc    false            �            1259    29807606 ?   ingreso_plataforma_prof_especi_ingreso_plataforma_prof_e_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ingreso_plataforma_prof_especi_ingreso_plataforma_prof_e_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.ingreso_plataforma_prof_especi_ingreso_plataforma_prof_e_id_seq;
       public          dzmfrgrrkgatqc    false    214            �           0    0 ?   ingreso_plataforma_prof_especi_ingreso_plataforma_prof_e_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.ingreso_plataforma_prof_especi_ingreso_plataforma_prof_e_id_seq OWNED BY public.ingreso_plataforma_prof_especialista.ingreso_plataforma_prof_e_id;
          public          dzmfrgrrkgatqc    false    213            �            1259    29807595    ingreso_plataforma_prof_g    TABLE     �   CREATE TABLE public.ingreso_plataforma_prof_g (
    ingreso_plataforma_prof_g_id integer NOT NULL,
    profesor_id integer NOT NULL,
    num_ing integer NOT NULL,
    fecha_ingreso character varying(90)
);
 -   DROP TABLE public.ingreso_plataforma_prof_g;
       public         heap    dzmfrgrrkgatqc    false            �            1259    29807593 :   ingreso_plataforma_prof_g_ingreso_plataforma_prof_g_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ingreso_plataforma_prof_g_ingreso_plataforma_prof_g_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 Q   DROP SEQUENCE public.ingreso_plataforma_prof_g_ingreso_plataforma_prof_g_id_seq;
       public          dzmfrgrrkgatqc    false    212            �           0    0 :   ingreso_plataforma_prof_g_ingreso_plataforma_prof_g_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.ingreso_plataforma_prof_g_ingreso_plataforma_prof_g_id_seq OWNED BY public.ingreso_plataforma_prof_g.ingreso_plataforma_prof_g_id;
          public          dzmfrgrrkgatqc    false    211            �            1259    25997766    inscripcion_grado    TABLE     ^  CREATE TABLE public.inscripcion_grado (
    estudiante_id integer NOT NULL,
    materia_id integer NOT NULL,
    profesor_id integer NOT NULL,
    calificacion_b1 numeric(4,2) DEFAULT 0,
    campo1_b1 numeric(4,2) DEFAULT 0,
    campo2_b1 numeric(4,2) DEFAULT 0,
    campo3_b1 numeric(4,2) DEFAULT 0,
    campo4_b1 numeric(4,2) DEFAULT 0,
    campo5_b1 numeric(4,2) DEFAULT 0,
    calificacion_b2 numeric(4,2) DEFAULT 0,
    campo1_b2 numeric(4,2) DEFAULT 0,
    campo2_b2 numeric(4,2) DEFAULT 0,
    campo3_b2 numeric(4,2) DEFAULT 0,
    campo4_b2 numeric(4,2) DEFAULT 0,
    campo5_b2 numeric(4,2) DEFAULT 0,
    calificacion_b3 numeric(4,2) DEFAULT 0,
    campo1_b3 numeric(4,2) DEFAULT 0,
    campo2_b3 numeric(4,2) DEFAULT 0,
    campo3_b3 numeric(4,2) DEFAULT 0,
    campo4_b3 numeric(4,2) DEFAULT 0,
    campo5_b3 numeric(4,2) DEFAULT 0,
    calificacion_b4 numeric(4,2) DEFAULT 0,
    campo1_b4 numeric(4,2) DEFAULT 0,
    campo2_b4 numeric(4,2) DEFAULT 0,
    campo3_b4 numeric(4,2) DEFAULT 0,
    campo4_b4 numeric(4,2) DEFAULT 0,
    campo5_b4 numeric(4,2) DEFAULT 0,
    promedio numeric(4,2) DEFAULT 0
);
 %   DROP TABLE public.inscripcion_grado;
       public         heap    dzmfrgrrkgatqc    false            �            1259    25997760    materia    TABLE       CREATE TABLE public.materia (
    materia_id integer NOT NULL,
    nombre character varying(90) NOT NULL,
    estado character(2),
    grado character varying(5),
    CONSTRAINT estado_ck CHECK ((estado = ANY (ARRAY['A'::bpchar, 'S'::bpchar, 'B'::bpchar])))
);
    DROP TABLE public.materia;
       public         heap    dzmfrgrrkgatqc    false            �            1259    30050488    pago_profesor_especialista    TABLE     �  CREATE TABLE public.pago_profesor_especialista (
    pago_profesor_especiasialista_id integer NOT NULL,
    profesor_id integer NOT NULL,
    monto numeric(8,2) DEFAULT 0,
    maximo numeric(8,2) DEFAULT 0,
    fecha character varying(50),
    mes character varying(50),
    quincena character varying(100),
    status character(2),
    CONSTRAINT pago_profesor_especialista_status_check CHECK (((status = 'P'::bpchar) OR (status = 'SP'::bpchar) OR (status = 'A'::bpchar)))
);
 .   DROP TABLE public.pago_profesor_especialista;
       public         heap    dzmfrgrrkgatqc    false            �            1259    30050486 ?   pago_profesor_especialista_pago_profesor_especiasialista_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pago_profesor_especialista_pago_profesor_especiasialista_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.pago_profesor_especialista_pago_profesor_especiasialista_id_seq;
       public          dzmfrgrrkgatqc    false    220            �           0    0 ?   pago_profesor_especialista_pago_profesor_especiasialista_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pago_profesor_especialista_pago_profesor_especiasialista_id_seq OWNED BY public.pago_profesor_especialista.pago_profesor_especiasialista_id;
          public          dzmfrgrrkgatqc    false    219            �            1259    30048753    pago_profesor_grado    TABLE     �  CREATE TABLE public.pago_profesor_grado (
    pago_profesor_grado_id integer NOT NULL,
    profesor_id integer NOT NULL,
    monto numeric(8,2) DEFAULT 0,
    maximo numeric(8,2) DEFAULT 0,
    fecha character varying(50),
    mes character varying(50),
    quincena character varying(100),
    status character(2),
    CONSTRAINT pago_profesor_grado_status_check CHECK (((status = 'P'::bpchar) OR (status = 'SP'::bpchar) OR (status = 'A'::bpchar)))
);
 '   DROP TABLE public.pago_profesor_grado;
       public         heap    dzmfrgrrkgatqc    false            �            1259    30048751 .   pago_profesor_grado_pago_profesor_grado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pago_profesor_grado_pago_profesor_grado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.pago_profesor_grado_pago_profesor_grado_id_seq;
       public          dzmfrgrrkgatqc    false    216            �           0    0 .   pago_profesor_grado_pago_profesor_grado_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pago_profesor_grado_pago_profesor_grado_id_seq OWNED BY public.pago_profesor_grado.pago_profesor_grado_id;
          public          dzmfrgrrkgatqc    false    215            �            1259    25997754    profesor_especialista    TABLE     ~  CREATE TABLE public.profesor_especialista (
    profesor_id integer NOT NULL,
    curp character varying(100),
    nombre character varying(30) NOT NULL,
    apellido_pat character varying(30) NOT NULL,
    apellido_mat character varying(30),
    edad integer NOT NULL,
    telefono character varying(30),
    correo_electronico character varying(50),
    passwords character varying(50),
    estado character(2),
    grado character varying(40) NOT NULL,
    nombre_materia character varying(30),
    ingresos_pltaforma integer DEFAULT 0,
    CONSTRAINT estado_ck CHECK ((estado = ANY (ARRAY['A'::bpchar, 'S'::bpchar, 'B'::bpchar])))
);
 )   DROP TABLE public.profesor_especialista;
       public         heap    dzmfrgrrkgatqc    false            �            1259    25997745    profesor_grado    TABLE     N  CREATE TABLE public.profesor_grado (
    profesor_id integer NOT NULL,
    curp character varying(100),
    nombre character varying(30) NOT NULL,
    apellido_pat character varying(30) NOT NULL,
    apellido_mat character varying(30),
    edad integer NOT NULL,
    telefono character varying(30),
    correo_electronico character varying(50),
    passwords character varying(255),
    estado character(2),
    grado character varying(40) NOT NULL,
    ingresos_pltaforma integer DEFAULT 0,
    CONSTRAINT estado_ck CHECK ((estado = ANY (ARRAY['A'::bpchar, 'S'::bpchar, 'B'::bpchar])))
);
 "   DROP TABLE public.profesor_grado;
       public         heap    dzmfrgrrkgatqc    false            �            1259    30701746    promedio    TABLE     Q  CREATE TABLE public.promedio (
    promedio_id integer NOT NULL,
    estudiante_id integer NOT NULL,
    grado character varying(5),
    promedio_b1 numeric(4,2) DEFAULT 0,
    promedio_b2 numeric(4,2) DEFAULT 0,
    promedio_b3 numeric(4,2) DEFAULT 0,
    promedio_b4 numeric(4,2) DEFAULT 0,
    promedio_toal numeric(4,2) DEFAULT 0
);
    DROP TABLE public.promedio;
       public         heap    dzmfrgrrkgatqc    false            �            1259    30701744    promedio_promedio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promedio_promedio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.promedio_promedio_id_seq;
       public          dzmfrgrrkgatqc    false    222            �           0    0    promedio_promedio_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.promedio_promedio_id_seq OWNED BY public.promedio.promedio_id;
          public          dzmfrgrrkgatqc    false    221            �            1259    29583085    tarea    TABLE     i  CREATE TABLE public.tarea (
    tarea_id integer NOT NULL,
    nombre_tarea character varying(90) NOT NULL,
    grado character varying(5),
    descripcion_encabezado character varying(150),
    descripcion_cuerpo text,
    link text DEFAULT '#'::text,
    fecha_dejado character varying(90) DEFAULT NULL::character varying,
    link2 text DEFAULT '#'::text
);
    DROP TABLE public.tarea;
       public         heap    dzmfrgrrkgatqc    false            �            1259    29583083    tarea_tarea_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tarea_tarea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tarea_tarea_id_seq;
       public          dzmfrgrrkgatqc    false    208            �           0    0    tarea_tarea_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tarea_tarea_id_seq OWNED BY public.tarea.tarea_id;
          public          dzmfrgrrkgatqc    false    207            �           2604    30048788    colegiaturas colegiatura_id    DEFAULT     �   ALTER TABLE ONLY public.colegiaturas ALTER COLUMN colegiatura_id SET DEFAULT nextval('public.colegiaturas_colegiatura_id_seq'::regclass);
 J   ALTER TABLE public.colegiaturas ALTER COLUMN colegiatura_id DROP DEFAULT;
       public          dzmfrgrrkgatqc    false    218    217    218            �           2604    29807585 >   ingreso_plataforma_estudiante ingreso_plataforma_estudiante_id    DEFAULT     �   ALTER TABLE ONLY public.ingreso_plataforma_estudiante ALTER COLUMN ingreso_plataforma_estudiante_id SET DEFAULT nextval('public.ingreso_plataforma_estudiante_ingreso_plataforma_estudiante_seq'::regclass);
 m   ALTER TABLE public.ingreso_plataforma_estudiante ALTER COLUMN ingreso_plataforma_estudiante_id DROP DEFAULT;
       public          dzmfrgrrkgatqc    false    209    210    210            �           2604    29807611 A   ingreso_plataforma_prof_especialista ingreso_plataforma_prof_e_id    DEFAULT     �   ALTER TABLE ONLY public.ingreso_plataforma_prof_especialista ALTER COLUMN ingreso_plataforma_prof_e_id SET DEFAULT nextval('public.ingreso_plataforma_prof_especi_ingreso_plataforma_prof_e_id_seq'::regclass);
 p   ALTER TABLE public.ingreso_plataforma_prof_especialista ALTER COLUMN ingreso_plataforma_prof_e_id DROP DEFAULT;
       public          dzmfrgrrkgatqc    false    214    213    214            �           2604    29807598 6   ingreso_plataforma_prof_g ingreso_plataforma_prof_g_id    DEFAULT     �   ALTER TABLE ONLY public.ingreso_plataforma_prof_g ALTER COLUMN ingreso_plataforma_prof_g_id SET DEFAULT nextval('public.ingreso_plataforma_prof_g_ingreso_plataforma_prof_g_id_seq'::regclass);
 e   ALTER TABLE public.ingreso_plataforma_prof_g ALTER COLUMN ingreso_plataforma_prof_g_id DROP DEFAULT;
       public          dzmfrgrrkgatqc    false    211    212    212            �           2604    30050491 ;   pago_profesor_especialista pago_profesor_especiasialista_id    DEFAULT     �   ALTER TABLE ONLY public.pago_profesor_especialista ALTER COLUMN pago_profesor_especiasialista_id SET DEFAULT nextval('public.pago_profesor_especialista_pago_profesor_especiasialista_id_seq'::regclass);
 j   ALTER TABLE public.pago_profesor_especialista ALTER COLUMN pago_profesor_especiasialista_id DROP DEFAULT;
       public          dzmfrgrrkgatqc    false    219    220    220            �           2604    30048756 *   pago_profesor_grado pago_profesor_grado_id    DEFAULT     �   ALTER TABLE ONLY public.pago_profesor_grado ALTER COLUMN pago_profesor_grado_id SET DEFAULT nextval('public.pago_profesor_grado_pago_profesor_grado_id_seq'::regclass);
 Y   ALTER TABLE public.pago_profesor_grado ALTER COLUMN pago_profesor_grado_id DROP DEFAULT;
       public          dzmfrgrrkgatqc    false    216    215    216            �           2604    30701749    promedio promedio_id    DEFAULT     |   ALTER TABLE ONLY public.promedio ALTER COLUMN promedio_id SET DEFAULT nextval('public.promedio_promedio_id_seq'::regclass);
 C   ALTER TABLE public.promedio ALTER COLUMN promedio_id DROP DEFAULT;
       public          dzmfrgrrkgatqc    false    221    222    222            �           2604    29583088    tarea tarea_id    DEFAULT     p   ALTER TABLE ONLY public.tarea ALTER COLUMN tarea_id SET DEFAULT nextval('public.tarea_tarea_id_seq'::regclass);
 =   ALTER TABLE public.tarea ALTER COLUMN tarea_id DROP DEFAULT;
       public          dzmfrgrrkgatqc    false    208    207    208            �          0    30048785    colegiaturas 
   TABLE DATA           o   COPY public.colegiaturas (colegiatura_id, estudiante_id, monto, maximo, fecha, mes, status, ciclo) FROM stdin;
    public          dzmfrgrrkgatqc    false    218   U�       �          0    25997736 
   estudiante 
   TABLE DATA           �   COPY public.estudiante (estudiante_id, curp, nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono_casa, telefono_celular, correo_electronico, passwords, dia_registro, estado, ingresos_pltaforma) FROM stdin;
    public          dzmfrgrrkgatqc    false    202   9�       �          0    29807582    ingreso_plataforma_estudiante 
   TABLE DATA           �   COPY public.ingreso_plataforma_estudiante (ingreso_plataforma_estudiante_id, estudiante_id, num_ing, fecha_ingreso) FROM stdin;
    public          dzmfrgrrkgatqc    false    210   =�       �          0    29807608 $   ingreso_plataforma_prof_especialista 
   TABLE DATA           �   COPY public.ingreso_plataforma_prof_especialista (ingreso_plataforma_prof_e_id, profesor_id, num_ing, fecha_ingreso) FROM stdin;
    public          dzmfrgrrkgatqc    false    214   ��      �          0    29807595    ingreso_plataforma_prof_g 
   TABLE DATA           v   COPY public.ingreso_plataforma_prof_g (ingreso_plataforma_prof_g_id, profesor_id, num_ing, fecha_ingreso) FROM stdin;
    public          dzmfrgrrkgatqc    false    212   u�      �          0    25997766    inscripcion_grado 
   TABLE DATA           }  COPY public.inscripcion_grado (estudiante_id, materia_id, profesor_id, calificacion_b1, campo1_b1, campo2_b1, campo3_b1, campo4_b1, campo5_b1, calificacion_b2, campo1_b2, campo2_b2, campo3_b2, campo4_b2, campo5_b2, calificacion_b3, campo1_b3, campo2_b3, campo3_b3, campo4_b3, campo5_b3, calificacion_b4, campo1_b4, campo2_b4, campo3_b4, campo4_b4, campo5_b4, promedio) FROM stdin;
    public          dzmfrgrrkgatqc    false    206   ?�      �          0    25997760    materia 
   TABLE DATA           D   COPY public.materia (materia_id, nombre, estado, grado) FROM stdin;
    public          dzmfrgrrkgatqc    false    205   z      �          0    30050488    pago_profesor_especialista 
   TABLE DATA           �   COPY public.pago_profesor_especialista (pago_profesor_especiasialista_id, profesor_id, monto, maximo, fecha, mes, quincena, status) FROM stdin;
    public          dzmfrgrrkgatqc    false    220   �      �          0    30048753    pago_profesor_grado 
   TABLE DATA              COPY public.pago_profesor_grado (pago_profesor_grado_id, profesor_id, monto, maximo, fecha, mes, quincena, status) FROM stdin;
    public          dzmfrgrrkgatqc    false    216   �      �          0    25997754    profesor_especialista 
   TABLE DATA           �   COPY public.profesor_especialista (profesor_id, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords, estado, grado, nombre_materia, ingresos_pltaforma) FROM stdin;
    public          dzmfrgrrkgatqc    false    204   e      �          0    25997745    profesor_grado 
   TABLE DATA           �   COPY public.profesor_grado (profesor_id, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords, estado, grado, ingresos_pltaforma) FROM stdin;
    public          dzmfrgrrkgatqc    false    203         �          0    30701746    promedio 
   TABLE DATA           �   COPY public.promedio (promedio_id, estudiante_id, grado, promedio_b1, promedio_b2, promedio_b3, promedio_b4, promedio_toal) FROM stdin;
    public          dzmfrgrrkgatqc    false    222   �      �          0    29583085    tarea 
   TABLE DATA           �   COPY public.tarea (tarea_id, nombre_tarea, grado, descripcion_encabezado, descripcion_cuerpo, link, fecha_dejado, link2) FROM stdin;
    public          dzmfrgrrkgatqc    false    208   �!      �           0    0    colegiaturas_colegiatura_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.colegiaturas_colegiatura_id_seq', 270, true);
          public          dzmfrgrrkgatqc    false    217            �           0    0 ?   ingreso_plataforma_estudiante_ingreso_plataforma_estudiante_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public.ingreso_plataforma_estudiante_ingreso_plataforma_estudiante_seq', 4782, true);
          public          dzmfrgrrkgatqc    false    209            �           0    0 ?   ingreso_plataforma_prof_especi_ingreso_plataforma_prof_e_id_seq    SEQUENCE SET     o   SELECT pg_catalog.setval('public.ingreso_plataforma_prof_especi_ingreso_plataforma_prof_e_id_seq', 755, true);
          public          dzmfrgrrkgatqc    false    213            �           0    0 :   ingreso_plataforma_prof_g_ingreso_plataforma_prof_g_id_seq    SEQUENCE SET     j   SELECT pg_catalog.setval('public.ingreso_plataforma_prof_g_ingreso_plataforma_prof_g_id_seq', 708, true);
          public          dzmfrgrrkgatqc    false    211            �           0    0 ?   pago_profesor_especialista_pago_profesor_especiasialista_id_seq    SEQUENCE SET     m   SELECT pg_catalog.setval('public.pago_profesor_especialista_pago_profesor_especiasialista_id_seq', 1, true);
          public          dzmfrgrrkgatqc    false    219            �           0    0 .   pago_profesor_grado_pago_profesor_grado_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.pago_profesor_grado_pago_profesor_grado_id_seq', 12, true);
          public          dzmfrgrrkgatqc    false    215            �           0    0    promedio_promedio_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.promedio_promedio_id_seq', 133, true);
          public          dzmfrgrrkgatqc    false    221            �           0    0    tarea_tarea_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tarea_tarea_id_seq', 881, true);
          public          dzmfrgrrkgatqc    false    207                       2606    30048793    colegiaturas colegiaturas_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.colegiaturas
    ADD CONSTRAINT colegiaturas_pkey PRIMARY KEY (colegiatura_id);
 H   ALTER TABLE ONLY public.colegiaturas DROP CONSTRAINT colegiaturas_pkey;
       public            dzmfrgrrkgatqc    false    218            �           2606    25997744    estudiante estudiante_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (estudiante_id);
 D   ALTER TABLE ONLY public.estudiante DROP CONSTRAINT estudiante_pkey;
       public            dzmfrgrrkgatqc    false    202            �           2606    29807587 @   ingreso_plataforma_estudiante ingreso_plataforma_estudiante_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ingreso_plataforma_estudiante
    ADD CONSTRAINT ingreso_plataforma_estudiante_pkey PRIMARY KEY (ingreso_plataforma_estudiante_id);
 j   ALTER TABLE ONLY public.ingreso_plataforma_estudiante DROP CONSTRAINT ingreso_plataforma_estudiante_pkey;
       public            dzmfrgrrkgatqc    false    210                       2606    29807613 N   ingreso_plataforma_prof_especialista ingreso_plataforma_prof_especialista_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ingreso_plataforma_prof_especialista
    ADD CONSTRAINT ingreso_plataforma_prof_especialista_pkey PRIMARY KEY (ingreso_plataforma_prof_e_id);
 x   ALTER TABLE ONLY public.ingreso_plataforma_prof_especialista DROP CONSTRAINT ingreso_plataforma_prof_especialista_pkey;
       public            dzmfrgrrkgatqc    false    214                       2606    29807600 8   ingreso_plataforma_prof_g ingreso_plataforma_prof_g_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ingreso_plataforma_prof_g
    ADD CONSTRAINT ingreso_plataforma_prof_g_pkey PRIMARY KEY (ingreso_plataforma_prof_g_id);
 b   ALTER TABLE ONLY public.ingreso_plataforma_prof_g DROP CONSTRAINT ingreso_plataforma_prof_g_pkey;
       public            dzmfrgrrkgatqc    false    212            �           2606    25997795 (   inscripcion_grado inscripcion_grado_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.inscripcion_grado
    ADD CONSTRAINT inscripcion_grado_pkey PRIMARY KEY (estudiante_id, materia_id, profesor_id);
 R   ALTER TABLE ONLY public.inscripcion_grado DROP CONSTRAINT inscripcion_grado_pkey;
       public            dzmfrgrrkgatqc    false    206    206    206            �           2606    25997765    materia materia_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.materia
    ADD CONSTRAINT materia_pkey PRIMARY KEY (materia_id);
 >   ALTER TABLE ONLY public.materia DROP CONSTRAINT materia_pkey;
       public            dzmfrgrrkgatqc    false    205            	           2606    30050496 :   pago_profesor_especialista pago_profesor_especialista_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.pago_profesor_especialista
    ADD CONSTRAINT pago_profesor_especialista_pkey PRIMARY KEY (pago_profesor_especiasialista_id);
 d   ALTER TABLE ONLY public.pago_profesor_especialista DROP CONSTRAINT pago_profesor_especialista_pkey;
       public            dzmfrgrrkgatqc    false    220                       2606    30048761 ,   pago_profesor_grado pago_profesor_grado_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.pago_profesor_grado
    ADD CONSTRAINT pago_profesor_grado_pkey PRIMARY KEY (pago_profesor_grado_id);
 V   ALTER TABLE ONLY public.pago_profesor_grado DROP CONSTRAINT pago_profesor_grado_pkey;
       public            dzmfrgrrkgatqc    false    216            �           2606    25997759 0   profesor_especialista profesor_especialista_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.profesor_especialista
    ADD CONSTRAINT profesor_especialista_pkey PRIMARY KEY (profesor_id);
 Z   ALTER TABLE ONLY public.profesor_especialista DROP CONSTRAINT profesor_especialista_pkey;
       public            dzmfrgrrkgatqc    false    204            �           2606    25997753 "   profesor_grado profesor_grado_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.profesor_grado
    ADD CONSTRAINT profesor_grado_pkey PRIMARY KEY (profesor_id);
 L   ALTER TABLE ONLY public.profesor_grado DROP CONSTRAINT profesor_grado_pkey;
       public            dzmfrgrrkgatqc    false    203                       2606    30701756    promedio promedio_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.promedio
    ADD CONSTRAINT promedio_pkey PRIMARY KEY (promedio_id);
 @   ALTER TABLE ONLY public.promedio DROP CONSTRAINT promedio_pkey;
       public            dzmfrgrrkgatqc    false    222            �           2606    29583090    tarea tarea_id_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_id_pkey PRIMARY KEY (tarea_id);
 =   ALTER TABLE ONLY public.tarea DROP CONSTRAINT tarea_id_pkey;
       public            dzmfrgrrkgatqc    false    208                       2606    29807588 0   ingreso_plataforma_estudiante estudiante_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingreso_plataforma_estudiante
    ADD CONSTRAINT estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(estudiante_id);
 Z   ALTER TABLE ONLY public.ingreso_plataforma_estudiante DROP CONSTRAINT estudiante_id_fkey;
       public          dzmfrgrrkgatqc    false    202    3827    210                       2606    30048794    colegiaturas estudiante_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colegiaturas
    ADD CONSTRAINT estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(estudiante_id);
 I   ALTER TABLE ONLY public.colegiaturas DROP CONSTRAINT estudiante_id_fkey;
       public          dzmfrgrrkgatqc    false    202    218    3827                       2606    30701757    promedio estudiante_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.promedio
    ADD CONSTRAINT estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(estudiante_id);
 E   ALTER TABLE ONLY public.promedio DROP CONSTRAINT estudiante_id_fkey;
       public          dzmfrgrrkgatqc    false    3827    202    222                       2606    25997796 6   inscripcion_grado inscripcion_grado_estudiante_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inscripcion_grado
    ADD CONSTRAINT inscripcion_grado_estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(estudiante_id);
 `   ALTER TABLE ONLY public.inscripcion_grado DROP CONSTRAINT inscripcion_grado_estudiante_id_fkey;
       public          dzmfrgrrkgatqc    false    206    202    3827                       2606    25997801 3   inscripcion_grado inscripcion_grado_materia_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inscripcion_grado
    ADD CONSTRAINT inscripcion_grado_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES public.materia(materia_id);
 ]   ALTER TABLE ONLY public.inscripcion_grado DROP CONSTRAINT inscripcion_grado_materia_id_fkey;
       public          dzmfrgrrkgatqc    false    205    3833    206                       2606    25997806 4   inscripcion_grado inscripcion_grado_profesor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inscripcion_grado
    ADD CONSTRAINT inscripcion_grado_profesor_id_fkey FOREIGN KEY (profesor_id) REFERENCES public.profesor_grado(profesor_id);
 ^   ALTER TABLE ONLY public.inscripcion_grado DROP CONSTRAINT inscripcion_grado_profesor_id_fkey;
       public          dzmfrgrrkgatqc    false    206    3829    203                       2606    29807601 *   ingreso_plataforma_prof_g profesor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingreso_plataforma_prof_g
    ADD CONSTRAINT profesor_id_fkey FOREIGN KEY (profesor_id) REFERENCES public.profesor_grado(profesor_id);
 T   ALTER TABLE ONLY public.ingreso_plataforma_prof_g DROP CONSTRAINT profesor_id_fkey;
       public          dzmfrgrrkgatqc    false    3829    203    212                       2606    29807614 5   ingreso_plataforma_prof_especialista profesor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingreso_plataforma_prof_especialista
    ADD CONSTRAINT profesor_id_fkey FOREIGN KEY (profesor_id) REFERENCES public.profesor_especialista(profesor_id);
 _   ALTER TABLE ONLY public.ingreso_plataforma_prof_especialista DROP CONSTRAINT profesor_id_fkey;
       public          dzmfrgrrkgatqc    false    204    3831    214                       2606    30048762 $   pago_profesor_grado profesor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pago_profesor_grado
    ADD CONSTRAINT profesor_id_fkey FOREIGN KEY (profesor_id) REFERENCES public.profesor_grado(profesor_id);
 N   ALTER TABLE ONLY public.pago_profesor_grado DROP CONSTRAINT profesor_id_fkey;
       public          dzmfrgrrkgatqc    false    3829    216    203                       2606    30050497 +   pago_profesor_especialista profesor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pago_profesor_especialista
    ADD CONSTRAINT profesor_id_fkey FOREIGN KEY (profesor_id) REFERENCES public.profesor_especialista(profesor_id);
 U   ALTER TABLE ONLY public.pago_profesor_especialista DROP CONSTRAINT profesor_id_fkey;
       public          dzmfrgrrkgatqc    false    220    204    3831            �   �  x���[��E����X�x��(�6(H�@�lx��������
@� #��f�n���Qk�F�����?�q{���f?�y�E����}��翾~�������'ߍ�Č'fdiw���Pm�Ͽ|��󗏯8T�0��Z����?}��-��$��<'���闔$%���y����/���Sh���ѷ<��ySȄv�F��2>d�Ҽ��#8o�j|'�S��Y�f̷?������Y|"�+��q��ÿ_?N�~B8��;�ch�<o}��k���Q���t�d*qƽ�C��j�Uc.�x��x��R$�[�5�3E��(�u�L�K5�V����`�,����������I��b�E�0ƿ�4�(b�[�~��YB����T���V��;��[I+�T��dӄJ$�xm���LA�E
V���깂D�$��<��`њ`�F� ��Ө����#��H�'�%��2��,�j��1	1���7у�OO�,���y�$־��jޙ�1�S1�*r�T:���Ĭ�DZ�f�g��;1+Ix�	1O�Ĭ\�����l��U�9�P
�cu5$�D̪E
����(R1�=)'b
��>��oŬ!f����@��H�y������{#�c+f�%"jG�`$1�*r���o�N��J$D�~�-AU��Q�$�Щ�i"f�"Ős��r1[hǮ8Q�t|�t�MK�T:W��o�ެ���'B��|��96�����v�G�E+*h�mV�Y$y3&��z���H1E��&mYoO����+��g±4����;m0��p���!h��=��O<�	�K�I�31v-bd���<��^B�?d�T�}9���+#;l��g����[�ƶ�Zl{Y!kS�wÊ4+����DF��(�Ղ�9��|8Ɠ�j�&�,� �vt*hk#�����9Yc�k�~��ǧ�/�t�vM�h4*�&�|�yg+q���Z����إ��	�RV�����9�}t쭍���H�)	~���iE�ϔP�[Ug/Rd��k�-�Q�X�� ���%�݉�!��Y���Z��w�f�\��<�T\r_(bCI��1��v��G�((�Jsq	3��Lf�8�'�"�N�K��t_,-rF��V�J���!:�ݾX�H¾X|4�ɾX�HA=�<�[�/�,rO3�����&������.�tg4��r�"��'c]Z���gbͧ~�;���M�a��)�לD��1ݗP�`���0���
���(���5#!��^cP����`�w�&�|J(�8�Y�g�F��C�{��\ �+izL�U����!�Ω C��!��Ҿ�=�dm���@��Y�C1�v�Ɇgo-Q�-Z"��c_s�8�Ol2�ўb�]a	X�{H���iv�l�о���h_��^6D�5��w�#&�J�5uC�;b�]���G6v&�<��4β�������㙬c�]���e��L�1̾|+j����Ch�Y6
%�O�L1�8S�t��
rDjs�c�}�?��s�N�1ڮ�DE]h��b�]A��R���9�h��6�N���bϠ�\1�&9�xQ֨ϕ��(����-�E[k���b�]a!�!{o}u���5��sw�~[Đ��b�\���b�]�x�9�t��c�}�w�$�0��H�q,k1�����7��t��4WǄ����(�=
�<P�>s-�|��QTĦޙm��
�*�a;g�b�}��#�֋��sWP�k]UQ��D��
J�FE=�G��sW0�P��6|�A�5h�-��\*�rW0H!�~�:F��o���uf�����N�A4����5U��P�����oo1!h��x���}�M��Q�5m�yy.}?I���WX��7o��M��K���"�W��W�݊(���۾���{�ד>�Jgs�
M�y��e��_�ȋtt��d���"�c���锛�4^���29��Q���f�iL��id��Bq��wk���:&��UX������ݸ��D(�P;Y��QAA�yl�?
�����cty�6�5Fݍf�clfrVG����ʇr�uT0h��/FE��:�`�J����|�����ވ:��tnG����\�a�\s�����#�V�a�TX����E��L* ��ܧ�[Q�ir���r7ގ�)��

]�M��3Q�qR� Y+�B�a���;�MO�M�i&깞���S��c<��MSQ��Y�^j��i�~�&���WӶU�˧#��L%��M.)���t���9I�oT��/���a�\b���~\v'�gr	®`F2�K�a�\��<�1��~Ʉ�pL.!L�y����a�\b|t�sHj���鸄�:xik���!~?�}����Dd��5��~�5Ǣ���ON�qx&׬S
"�	�I�V�O䝭��a�<��?#F���d��� ������� M''v	0�=ve1L#��֌7��aRyC��WZ�r�%�_h��bam��vI#��I[x���*?���#�98N�"d��vr�ᙴ����f��k��H\-�Ac��X0I%�'G|l��#i�XPIzh��CE�8&�Mt�l�Qc܏�'�#n-�m�E��k��^� ;O�1�[K7d�YaS5[�Y>��+ �����)���>�b [�5�
J�^��O�8��T0x�>���,��]��%k!��\s���3�l�Bӑ[��b��@�!@��b�e>�nK7&%��xZ�&J���[%�"���>��*iQ(ך����[��~��S�ǒH��ʅ�X��]+C����a1VX~�I��6g�9L�k���jnkc����8��i_���XA������p�r�����~*?��/V@h<�-�obp��|>M�'7kn dEI�������+��7A3����\�c����
Ǚ�1N�ic��Gͭʍ�]���yPW?���c���Ã����c�����h�nIZv����\��.:Ȟ����yz��[%ѕ��p��G�-����.z*��;w�흻��"��{���1D���'e�ss	�qX~b��_�p�RD����:l�k����;��a
^��%�Q9��a
VPlnQw�� 8��kԊ0Cf>#�+����k�����:��n���w�e�����g��h�"�����*��e}"4��Ld�[��>��N��_�0�4:�%��S`]7�c��F�r�;��f��_���|w�1X���#�=R�a^��k,����a^�b��ه|0�`����_��wG���mЎ0�_�_E��۹�2Y�/xM�e�BE�����޽��M�s      �      x��\Kr�H�]�N���Ϯ�DB��$m�� �d?Y$���f�ǘE/�u�y� )e��U��Ֆ"HIx�?��C�aZ>KSM�Q9ӣ$�6�˹ȧq��%Y��K�����B�D9M�H��2N�/�N���鿟���zs��^|,t���4,G������a��۪̅�����q����6�ˑ(�voiN{q�s�&K1��c���Os]�B���w5pW�ք�eؖ����PZ1��yR�"*�[���6��8���kA{���/"�����2pg�����~:�뇏�ǟ?�O=�ZL��2!b�6�,�-�JZ\M�	,��b)Jz����?�kÞ���f��7�,^
��}=�����U��Nh�>�9�︰��S}X����w�v��`(���fw����P%�'�Ҙ\���fմ���"�ܛ��^É�R�e*tlS�K�㳭<Ƕ���~�����{^��R��]��6.3��0��4����$��L�,%�W���J^��4�����i���A�;�{n~i������q�cCy]ƃx(.$�����;�k_o^�þ�؞�ߌ�Άb�1ì5vU䉸X���-�?��_�i1��E���G���ˇ�a��6�/ͫ��Z��^�B�ζ���;�1-�ŦO�Tx��Nn{�e"�������˧E%���[��ȗ�i��rƑ�7s]n`�N�=������U9.Y�δ���K?+�Q|a�I�Š���4�Y�1��M��N�;!<�O��5�J#,ĵllS^�B"v�M>�qo��j��i�.K]�>Dg������"�¾a�i���q�XO��f�xx~�� ��R��#Ha%,h4)���'x�*��t��G3�]���V��-��C��Y�`[���m�#;�^�Z�khϛ��9n��]�h�@��c��ؚc5QX΀L p-�d�0&-���X��]��?��ɳMZ���aXZ}����=5��i�g%���S��	�6�lY-�!�c���G�7�i)�BSn�.�i�G�eS���q�"���  �D؎�h���Pj6�n�|����'��Z��2ͳ<la���	�D�����.�M��+梺0���PD.��FOt��qn�tS�����m��!3��uA���2�/��۴<Jɘm�;>|�
��z��o�v}h^>6����O7O����?�Y�	�e񐲢o�0�ݠRV���X�E|��� C
F�q24�K]�@�o���T��ni��H�i������{��ݦ�L�i��(��7mv��gI
K��xK2k�0�ٹe���EDs�%\���ۮ�t-�<u�>��A!��u��X�ԁ6��c�jN�)1�qLN� B@�߂�ꔊ尐�Gհг�����a�_l�ű<��n��s��5%� �V$�r`P��*�J����YB�N*�N�e~�Ń�"T2�Zxx�.y}벎6,�[gd�l0@�� .��,9,�H�E9�����//�!>��� �B���PA�>B��a�~��G��9�%�(�>!�<�fȒP>AT���H[����	�f�_J"�LZ�p@$M��9����?��=nJ�q�*�;��yz�N�A{����2�h���D%�=��O)MV
і"������h�����T���\� C(Kr+lM������/�-��B�F��b�(P�'b�# ��|m6�������i���z��م���&bp��Lk��H���h�#��+"�K{����!��>P��Y���RPi�����Ͼ����qs�sV ��5�+�0��< .LQw)tԅ.��I�8]�Rf1�	,y����w"Ʋ)��@�*Fj	�yS?����h���9��@�͐bn�Y&q�68��`���s}X��@��ͫՋU��`,`� ��UKd9�\��ƞf ߍ�h\�-2چ��o:��pW�� @8|S�-���Sx<��a77��c������d��Lp��h�(�I��)�"�:[�D
h]�R����IɝHj��<�:m����m�B
g�}6'�kq�D�5�0E���6�Br$�-a���]Z_�!�'�M#Z���jp�u��q�/����@w)6�R�9r�h�)��Q��#I�Z̙��bк�v�dzV�h��~h6�f���O��*��H�e#�����.JI#�|�.᷋@��8��@7`�\��b���&�zS[�k��G�4����cre7 �Y`Q�wӔ��O"FE�����]�8BI񬬢bʃ�2A��E���������1����>s�2%��j�ED��\V-�Mxg2���Cjq�u�o9�ڞ��i��~��aW&�=y�M^2�����Kr�bu�s�X,�ߠ'�;��@.=��g�N���\�n�ۛ_��K}#����P8�6�f8$�&J!�|��X՘��o@��g�&����;���M�K�-&������5���t���ڄ� P(#q�)�]T�D�(w�Q-k�Ԥ.ZUD�(bu��8Pm�CCQ���cl�%2�%YI��i�2 ��Ҩ��e�5�9����֛���)G���c�
]B�5����l���
ค�x�-go^K5�@���  E����Eg�ͪbм>�tJ��|Vא�.����<޴�7�A��h�����uz��	��]�I1�?]o�ue����4�+�����ToH�V*.����X�(/t;����x�\�B#.�1��7\m���{Q�����|�mJ����3&�	$���_�ܪ�JGZF]Bm����f��|!�����I���R՛m�����f^���q�?!��%Jb���@K	���`��(G�/=��e�H�8sZВ�BP8��n���i���ItѾc�X����n�w{ҧ~H�c�\�f�	K��w������LH(Bp�E䳧�.q�{\.'��������Xbu�o�qAʅIdK�Uӂ8Y�|�<G{��v�������b�VWV�̷�- v���7�j��Ǥ����6��E;۽���,_{i�����=t�c�F�چA�2��uQ���)�u+�IF��K"k>���Ȏ0�\��[z�'d�\�+�Vx�=�E�������z;2�6�aPtk�������Z��������<�ꋞ�'�@������i�׻���T�c��i�/n�����Z(�`�A�3�9nQ���x��R*��[�H��KBuC���$��b�)��}	0�
ˀD\�M�lR@*��RW��,�"�,hށ�Oe^r�e6�TlY�*�?�d��H7iY�3�nh.gR�d���r:~[���v��L?^��j�Ga7cr9���l�(/��7i��,�H���紁@(ZВp ����0&� �["�/՚Ի�z�*eL.�*W����c[�+��z����s���XP9�H�C�7�騄��}@G�S����t
��ڌ�=Ǣ,�`B�wi��PM�sL�k��y A�_�)ߣ�JIy��$e9�jk;� r:����0�8awٖY�k���P�H�l^���e}��On?����6��-���FgFe��'-U���'�j�zI��ZZ�P��]���R����Y���,��-���^-�� ?źh�e� 5�hJ���^�я(>E��)۷L8��-D�5���D��S���EEnY��@��@X��8 ��@e�yRb�3=쎨�i��*�о�O�ݺ>7��z�cR���e*�3M,�1\|1�$�G�Tyb��zڊA�#i�\��+[ƾmc����f���A�V��]o��!Z�iE<���\4.�RP�QL���h[�T��p��R��0��S�<&�%�bۈ�؎o��\=o���i���=��K��2�	LG(�X�o������pM��ԕ> z�1���%C*\�+�a���N�i��/��n_�H�/��eZW�Q�I�~�ꘕ��d�PU�o2�t��.ðZ5�^s*h�A���m����{{)��'����LV�����-�:̫����\
�+�嵬S�NI
�7?�q 1+�L�X��f�Y��� �  ��tmx�-���`�`� ��C\t�g����T�Q%�u���� �=���O��&�f��:������Hv0�ç"1���:���,��J'���KF3�s������աyZ��X�r��'z���"t
�j�yФ<��FH:�h��;���
b��qK�.1��д�&���e����y\L3��7�"{G	|�<�V�;����J�ܯ����yՆ�����e5ި�������[ ?��/]~���_�á95*˹���㊾w��� ET#1$���$�%���:��b�Lr}Y�g�V�5�o;kq��T��(�k��<��m��e�V5��c�D���0��̡�=m!��tWr�W���SF,)i�(�[�Э��,� 3����-�/sp�ƥ:|ɽ & ���<��r.�3�P}
fw����s`�R�6�Tt4��z������u1�Me�ɐ���mn3�9�E���{%eCM�s�+� ���U��M�õ��@!;>P��|��*�ѫqu�%���2�op��*aj�,�:��F�u-$E��h�sI�}�N�\HP��N;�z$H��Z�9�Cy�@ͼ{z���}|�/2}�ɹ�m���p���Sz�3�@qi�g2�7�e�d=�i2�nFs �D�l��2�~�J%k�$W�&�>�0�Mb/���/�����&FjS:�M쥜�H:�9	F�wz���?*�|�\��cr,��p]��y��ԡ�jp��:�|8�8����Q�N�&=�Жg3�"o�,�g���Uy��"���e��2�����p*F\��S]֑3�I��*�~m�����x��Fk�D<Ni�ϐ�}A��H/�:nFu��I���󫨐�u�Т�r����%0oV��M<h!�X�JXROOV4�@d�w�O��|Ԯ�Bo������ܡFn�&�jg�!����>J�_'T3n+\?��a�#$���j>�< ��.J}��l��*(_S	�#��ʴ�'�U	��P+�q�J|�Zo��h 
�7l�
�� [#)�Ҭ����m�w���w� ��[.u�')b�<��a�Ʉ:�I[S�z�+:�o�mX���9�J`_N�AԫhwW.��"�h�*Kx�a2>�Uu�?7�d��`�Z�<�M �^��9uC��fL�<����]�\��ہG� S���K*�;pA�޽���g�bWJD�MOˋ��*%Bl6g���ZHQ���^hH���)P�0��}�ߖS����i}�+m3΋T�/rB;�W��V.�,ѫ�5nwI5��Z�v����\�RBr�����, O_@,@�_����%��̞w�,֑7���<}��dM�=����N��4����+@�!7{ ��zޛ�� &%�r@�Y�V�-Uru�{U~n����R����R
��C<�86v�>l�G�|5}#z�֦ІV+�y�RP�����mX�ܩ(��rͫ� 3��8�ǒ=M�D�:�/�fw����}eJ7d���bmO�T.oAc8�Z�"��(����%E�)F��3L��Z��SB���V�Ӽ�K�Z�����o+~�P���vA�Z��M����[�0�v~˕"��?W�L&�tE���j��~U!�>�������9�<8�ƃ�j�P0!/	xJ��V������Bۄ/|�7���˞ddoG�z�HipL��`1JE�0T!����D�?~����T9�Acz�\�'ڈ��m����rw�<D�`wayW1�]�'��Y2����BI���\4�\YDd���m�N�])�ʱ(��uF��V0��e5�V'Y���ܱ�������&�#��~ � [���B����:Y������9E����.S���ax)7�U[��� RD\>0%)�H^�y�KR$��H��t���1RD�lR�j~��sDj¶+8~�t�Ŝ ��y�i|�vX�S�^�|�򼽂�T@�n��"��8��\�w\�.�H���ю*����.҆X��E-	��[��&�-"�'�TH��R>=F0��q:�a^���b;��Z�ː��� ����'0l���ޮ�i��w9<ue;��Ɯ9�\�3(������Խ��线�+�>wEl�v-�����ޝ�zqʵ��N5��3(o(���c�E�T��N�4��N+н��"иL��0$�p���������o���PoVk�j�Ѵ-7�����gD���`W֡8_���Lҷm}�7��g�H]�����߶!���D�y���i[��Dq. L���׻������G%U�#�K,�]\�}��>"�ԇ�ժ�crw���<XA�!�ZW���3��?[�n�D|�s��&"���9K�3�+����-*�	 �.���497Cͽ"��K]6��F� S���!-dX
:=�ֿ���C&�	~q"ҿ�� ��zO�	��i**�*웊�:�Sh#�4��<�>UӱM?���8���H/C'Ţ ��&>��tD��I�� )夞�^���<���OTc��h5�)���z}�T����+;��ϭ�1�"�Tt�l4�:������|�V5��U�AX���ǖ%��|(��z�)�*�C�5pby�m�X2��~n�D�G|f��N�/;T`���5���M}8��S�|{�A� B��t�BtN�w�S��e ��]��=1B<���-BY੎��ҭ�Ӄ�<h���꼙,U\�ޟ�����ǹ���t%y��ݤ.�nL��� W�c'QZ���حl<,H�߷9���2m:���@�o�O������Ҁ�z�|R#Ki2$*8��ɩ�A���r�;hg�@���q_Z���:���jX��|]�n ��z��4[�Tn��H����'Ү��%G�m'�ϗ�W��z��_h�KMd[��T��<�6����"
HBC��`: � ˒��S3N����"_��s��x��+ў��L{L�*a���
jF����Pq����F�{��z<��A�:H^�Ű"	���O�]�z�>\��T̴��=�\����֖��9�E���؎��e�<� ���)Ǚ�:| >�E��T��S���2�*>;��1�I�OIV�������Hŝ��@�NxK^FR�Dm�Y�����/+@�� $�����U��m�ɳi�@P����L}���N��(����܀u2y�� ��'��2M㋴%�̢�-_��N��i��[��Ce�ֿ�kxE��?��И�"���"���yA��v_������C�{t������~hN�J�]=QP�;؛b<��']�%tEٝk�鹍#3�����M'��:�aр7���	�G
���@�����-X�?`nZ��)��c�ZOg\��V�<�إp�/���Yn,��<_=6�,�)yʃ-K�[mׄ���,��x��px����w���l��1�?J��Q-�\P�t��TP=�.���=��j*�v���b�Co����>�1�������5����^L%��&��� �t;�Ϋ}8$�uYb��K����e ����~�T]C�=��	X�����O�)Ni�      �      x�|}Y�$9��w�*�ށ&j��/��*���n��L��;%Q����O-��S�i���W�������c��8?g�.��O���Z�߰������V���O���6~lײ�g���bL�hF�S��{���?�=#f����=����ky` ����>�ޟů����i��zm~�i��`�O+?e/k��'��������;k�.��?�*D�ۧ�P�׏1��������_Ǩ�ڳ���O�k.�(���s�~�٫ۧZ�s}��������h�$���ʯ��[\���j�1u�� ������ԟ�;�Ǉ�(<	�,�%�	�9?��R�@9�l���;�T����F�gZK6�����2{���_@��r΁���jf� {u�\�{�O��k��O{�]�v8A�xR�m��(q��4)�^������@6l���ҳ=N��c�g��V>���T!��S׬x����:`p:?��@cbs��2֎�\KZ�����%���Q�͟�p�Χg{��Ee��, J|<�T�v�k�����,TA���%��\l��
cwh��=A��I��nP�59�A���^���3���s?�����'��g�lY�=��:�gp��@�2��g���ԩ����s3q(�
aBMT��/ɓ/���nx��}]�A����D���7�����u,����_І�������X͟T��<���q����5��R~�0�'�/�ɯ[�Z������Ut��\�,�����}���c�Ӕ�6D�3���wZ��:!�6(��c?�Ie�c I�<�o�.hЙ8�{}�$��]*Z�l��Ϭ� ��<����-[��;x@aT3��I�r�����n����9)��nޜV�>�3S��PN�@����P���\q��t�Ϥ��S�ԩ����OS)��,4g&�"�%>����X����|���	��%�Y5;w��C�. 'xQ���;�P�b�U�s�{�=E���6�g�l?�d����	Q}�%�C]d��x(�Ӛ9� Jl������'�k�b���m:��[�l�8���V�0l��]���tKmm:X=���»��=OǦ��y�F�r���*O���i�V��}��ߠ�ٖ��<Z���9>{f[�p����?����iaȄ�	>��)�-�?� X���w�.�'QN�g`��9�T�z��G������_��9�D=����3?���&��u����Z�9����LȲ�g�#���s
���9�$�`���,'�x�1
����\��I�A��Ny�e_2�_�`C�I���P&CV�\��Ӡ����MuP	��F/X�c4#��z�g0��8(ε��A%������k�f84v�M�T}�5��B�&+qPOu>����2����B)�KM(�b����?�6K=�� ���*���FG;�Y?�K�K�}`v~��W��6e�c�;����_�(�\�U��a	݀���Q^5������Ş���$��$�f�7�`��5���Ƣ���o��
��3�sZt��(�%{�6��-�}�Ta�bq?R��o�vd�փ����U؄@Eo�wa3�>)�.���rTUԦͽxj�>ΐ��!��
�k��([�$v�5W������h�Q/��u����&4��%�Q���:9P5{�)It�����tJ�&��J�pM�y�	��؂u{oߣi�
�4&���gY��E�R=�(����n�����.�Q�;JQ��=�ڣ�7�	�X�u���w�J�S>�5��
�69�O��R(�i�y��vM�>%�j�:J���F�p����Ј�5*u�:�>���(�^0�y[����`J�2Ǒj�(��t�5j�c_v�����iIT��/�w;�}�X!hL�d��*4�m��L�~oCGÂ\!z�e�j4�~�YY�{�D�7�G�N/~��2}�{�'���N�����x{�w���+Cu�/�K�;�t���Z|���_<�(���'�VrXT7ʞ���X3U�R�'�&�AG�1��8��Cx8�h�jI�͡�q�j���Xl��|E1��p�)����
m�����"{��z�U~���oQ�߸^d��*=�]�^doC��o��"{���g9�����E!]���:��+�{G��lO�����6W�1I��쁒$Z��1�赂�9�����}@EV(�B�h�P��W�a��o��R���妬ǥ_�����{�b\�{�j3�R���mmOY
�uaf�������;uiG�٥���>4Ӥf�IAk_ɷ��^(�!��Po�ɾɾ��5 Tj������^��Ƹ�(��j�9;�{���iX�Ч���e�;�~��}�EU&|&���}�(Y�7���>Q�|Qoߌ��z��q��pI��㶪�)�ÓvR�We}�'&tV����0(��R��cD�������F����[Ie/�1ְ�JeO��3�_�R�W�V܅4�Je�NG[�l>+�=���9�Y�}*{�x��[M�����o��:@�Ⱦ�D0���z�}�끻c�7�ȞiN���qw��"��S�J���ކ��o�$��ۖ�7�	��"{l;3ԫ�"{X����5h��Fy��3���NI��(�!ơ��/���#\c�^d��S]���({�Lfz�5�h�x�p��W=Ś��	h}��_�/(����k5O�&(��83�ͳ�	j��f-P3��d:*���&P+DW��m:t�9}��J6���k>/�û��g�����@Byq�7<K~m�� �c�j�(융��k�(H�P�c<��k3�|���	���[s����K(���{�Bm�g���>j�,�5h!��@��Y�2����^ʹ��j̑��<i�k��P�o,����ڿ�&�f���,�9�k��;|�4ӈ��/�VG�~�/����!��=�׈��p+���R��o�I(jL�4���+{�~�|�&U��~E1r�p"q:<�:jxA~�D�T�]�zx�P9��C^�1��Z��ϰy6A-�h��y���{Et��pz��Q�N3��M9���E���!�j��M����X-Ԅ$�}"��+����Rv<eo<i�F�5��Jvtٛ��F�6�EӝK��j������h�-�Ez�L���*���#Cy1U�<��⢎>go�{�˳d�O�#�����Q���bF���ۡ�+��3�T����X�s^Q�:`!��d���5y��'�R�O���t�.𤛒�	��@��S{l��(��8��P[���8��4jr�k��~*��x,V��(�b���Je?C���sm���{�p�P���_���jl`MTJU���Y���}ӎީ�
�[�߸S�#S�x-�i��o�ӡ��^��qjaHC�M�B�sh�M�B�|��Z�5גf�_��b8z��d/�)]����Q�WaE@��]�@�d�R�.{X�����y��1���ڴ}ϛ���}Wj��&{cv���Yo�W�^58���d_�T����P�ɯ�Q�ʏ}�yA)�[���t�������7�ȽĚ�żBw{�y�TK,��u��*N|���ڧ-�5 ��s���zV581@Y�1�J*����峢}�(euW�uQ�WEd��e�������}�$�浫��pl�$K�o�������+_k��;Q},����U0��T�]R�K��12Tg����5^��0��s���k���TX]�rj���ZW�:���)jའ��j�o?TeS7Cy��YC��=�[]~myX������P��p��ͽ�b��/
w�!�cȎj�#�]����<��DP��l �<Lj��R�w��SA���{����VF@�j���_Pʂ8,��_��pj���.���������c�P���
��^P����f���X)��o���b=���9"JqL:TƷ�_��Of���U��/�%yA=�W�^�V4n��g������P��kK����p�R�#��Rq6����\w�6E;"�TG���va���0�wt��/(X|{�����MA��xW�1���/�K�j�XR��E��    U�]5�ɳp�0�Π5VHE�9�'m��q��׆���������W,y�"x����P]q�{��
Y{G�^w+$�����/
������	q?�ި8i�k{�����D��_l�ʲ���{I^�va�_�=Kg��{}q�R��P��K۷˩�e��K�����`��<ʯ�R�o�ٙ랯�%_��'|�"��2J�x�`Oȯ�R�:�� �W�1���߫�9^g���V��'M~����2UZۇ�E}���/�e�8ܼ���f��͇�Xi�ʯM$!'��^����5U ��,�cȎڼ������QMV��6������#���`N���x��j���m����Y����c�S�_��}ci2�Z����_Ԥ�5��1��Ezsx{Uj.�.{��9����&;�3�	�<�.���]�l3�c�:v��f��ud���V<'��E��DVH���:�gr��Ѕ;v�|Qʱvv��&�b��MIE����v���#���z�}#�'��B@�6�_C������J��S�������������08F@��_T��C}�s�7�J���6@K�Ĳ�/��!�%�Wۆۅ���46����7��g� ����7��Z6��|m���xN;,������{O�2�_�T�	>̐_��_އGKt��
���,��W�G1<_����_�m��͗_\\��Xi�J�vUF
�ذ���_Q{�1�	�y��-M��!F}�}Um>l�r�z�}����ׁR9�	�$�]؇4ܯMP����kȯ�Q��*K��H��e��~�Q�}�͋��������w��i0�!��Y(f����>�Nr���h:.��"���!�c(V�^dO���נM���Ŭ.nQF �s忨��0��˳TA��7���qk�n�K���!Hzb��3t�)^X:���2;��K�c �]�^tΐϷ {������g	����E1���T{y{U3@C�Md$ݱ���gcUé��!������mTf�W��m��̾�(�0�_ԅ�ks�(�'��6z���oG�`<OJ~�����4(i�׈1G)?T�f�nx�쉨�f�J�c���r/RF�Y1;F�hJM<E�ci�ꊸ���'F�S�E�A��Q@��!y�W�	{b�8�=����X/7�׶�^�߼����{Ŝ���fX&l�!�6{���<_�j��n�B_�f��&(��I-g���׾�6-dv"�!����w��Z���W�K	VڰT�M� �_�����+ߗ$��Ŭ.q�<KuV�
�����g�G�\�Cxod��������<��=1c�~߆f�F��,Ҙ��m�
�#[։�u
�v+�[n�rp�_�����p1=�^Q�90��Q�k�S�jW�x%�P+�tx��.�i���s�ڤ)���5�!��/(X�<Xm��9�X�2��?V�/t��4�sQ���7�AL�����kG��N��1�E�D~m�������9?�}�p��c��Q��ѐ�t�:J=x�#i��kK\��ޚVa���s���QzUuCC~m�,EWV��U_P,|R��`%u�B���U9�UW��%��8��Pr�bUpǥ�����R�E{U~m�R�#��v����]ٔW��ϊu
_�_2(P��)�~mrz|Ծ�k3T��[��w�E��5�_<�]+T��3��kD�툃.��;�1ݯM�K69��)�%����A5J�Ė}G�:����K~m�(D�*�C��vf�+�1�TY�0΋��T�v�mb��<k(64�R�b�%>F~��m�_����t�&(s6�!��k�����XeA^K"�N_��[\1�o���.��P߶��T߫��(�pg	�^�y��T��q�Ve���e�<���s�6�SN���
*���#���k}��6��4t֯�Հ�=��byQ��8�­0��Y�X:{��ƚ@��N��_	T��������`uX�biD�w�~m��R�J��[t���Z����cUn����7�9���XYA���:P-�L��Imr��-�x:���T�����<��J�A{�q�_��� ���H~�|A�D�����r��>�A���_�oM`'aA��,���苚X�,����B+����(���������k#�s��kq��>�n�q��n,#m��v����Ur�x��y#ϫ��<P�@ž�}��i��~�^+��*�����rx�Ty_TW�����q�T��<k�+~C����kÎ��9�*mPJXG���Z:̧��%���ș�>|���_�����'=Ј=����7qh'������Jه��96bo�P�=�Z���l���/ʠ���{�5�wl�IA�#�6Qƌ��<�{�e�wR&�������]��!UK�{��V��B�*&���M�k��"��P��)��-r�8�T�X��1�,w�CJ��kD��ڻ�~��E�]u
S.>P'�:��	9��6c}�P�&e/�-�^do"Y��ĺ!��>g�.M�����>�b�v�U������Q���������(����ːϊ�͎���ؤ����{(�h�4>K��T�V�9
���kE�"\1�L~m�:��6o������LpC߯�� )�&3��{b�qLeu�
���y��Y���_�g[~m�R�-����	�Y^�$j娦��fU%{~���J�Ľ&d/�֞��g�
�c�(��j~3���kyy�d�����5���X��l�QF�96 ���k�V�顃S���	JJ\���@��Š{���cM���1 h�Y��ٔaag#�{�_;�~Q��k���k㳚�w�r_�Ɠ��M�hX��k���%K�г����x4� �u�@�WT�����F��O����E�64=o+���B�2�����<ʯ�P�k;�G�_'�9M�@��bf���Χ�۷��DS5=_��WS����	`W�_�=kҖ���|t�̷R��:`�
Փ{����Rz��p��Xq6i�g�r��c0��8`���Zd�c��,�]KSH������;�59��w�'�o^Pbq����Y����w'�~���V�o�̚������d����+wBf�T�+o�W��?������l?�o���9Eѯ��
y�_QU�͉C�~Aɓ����*c��!;5=C��Z���׮�*�/�Co�u�ɳ�"5}mh�)�6{����U�bA���(�q�b���jR+�ͨ�Lꐅ�m�K�<C-��:j˛�N �s'B�ޗ1+v���y<�^뷺�H^��<����k�t�W{��^Uu�%;����Q�E]��V�w�u�/
�;��$���Q��
�Ĳ�����X\�P��ǻ��7�EG�^U��o�S����b��1�sn]��`OT�b�s��9LL�b<G(';]���_�wuѹ��؅2(d`��N;�k�s�7�=��sέ8��M���g�{j��Z�W>G����X�=�cOȯ��Z�꺷Eê|m���W�i|V���Em<�wj�k�g����^D�\ξ/�rOX�9�˻42�5�G�9�/��H�U�}��������;�׶���(
�H+��:�d�:G,��X#r��qk<|��W.�W��ۤN�k�%��{��*�i1w�bm.>�}�!�[	y�ZeW�����Q]�V��:Q�%���Jg�_����fw�Tmrj�od��:���Q�r�	ΐ�k�f"�K��jb;��(�Y�U�"��ž��r,�b��ܚ@���r�b-��ԕ�˽C˭�J�+�X�QO�l��|m)<�@���V1���}�$��(�Pݮ�:
�׊5"�Rm:<�e����a9���$XL�oyDέ�*��+d�^��ž ��Wwz�(�H�;�_����甞4��7�x�2�I^c��i���Ū'&�Ro�sOT����Ջ߸S�{}����S���r��b�W������Y�¦�Α_�=Kφ�o\�(XV��۫�de(�o���]���羯�������%�Ğ��:$�_�NT�<㳼O��v�|V�X��-�۱A�X�p.�+-�[�ϊ�չU<�z�����5"�(1�1j=O���E��_�z���g2��)I������%3V��Y��w&o\�볔��(/r    �oV��WX����޶�H��%@q��'���]Rs���){�����2ǺJ�&���B����e�s/ٸ�'�x����޽�~:��|�2?���lso@��9Ñ�i�_���va%"��K���(L��9��~+G-�35��^^�e�S��dC]�D�sy��Tb�{ż����j�,���U���8�R�6G��Tj%�P��R�rc+�sέ)b'��Ɠ�T��Zk懖�ڧ��U��F��rި�h:�܏�y�r�/s�x/�}�	��h�_g@�{<�(����
ܯM�q�v���o�������b��j�o�"��=X'��9�c�!
XŎ��bmԹ�9����! ����w�c�o���ڠ��N�fZ��^P�K�
�F��ڧ7W�k��+
l����o��ܠ|mX�q�j�$�*�k���_��-﯍(��/��txm�RVnځŷ���`FQE��	%d���:6Y0�����9�s6����!?W{���+�o���Q�Cg�1�/�MP��@XسF����x����?�F��v�eKb�O���d���C~ �}�����bK"��h��\#�|�4�ަ}��F	u�K�D��F}Qd���c�}���j�j;��E�_T�Q:XyD~Q� 5}�E�������b��P:t��X�����>,�._�1��G�.�A�Ǔw�|�=�4�Wh�˞�gn-�k���8@m��y�w�s�C�O΁y�=PgVw��.{F;�`��J�k%�Pr{N�L}+���h��|���:�J)�u#�2P�}����귂���׾�p�6�VhEN�ss��t�5Hx/�z���+��V*�1�q�<�b��P�;�a��-�����>�VCv�{�U$�Z�>���f������
mu,����w9r�R�8���N�����@g����(�!h����_�����%z {�C~~�w����0�v�Sp�dlh3}J��(Y��|�ȧ�(1B%u���k_P��um"�6y�.���
}����=W���e�x/�!��{�7��kaϗ�;���,w�(v�̣�tިǝ�|�#�ޱ����_���I/�JP���;T�����t�`�J�����(eO������穥�ǰ��d�69Y<��Ȭ�7�K���z�w�$���s��v!�VT{E�E�/Ɯ��ԟ6a}��%�:jz-,�U�R�<��y��j缮�+�ɷ�����Kfc��(�3G���9�-n�1��<"���r�Wcc�g˯���R�	�6LP���Xi"iv���9ګFGM���ɻc˯}z:μ�^���k@e~��a<nRȔ�k��?b�q��t�-�6C�[���5�'��������b��Q�^[���D�;q�Oe�q�`��ܯ3�u;���[�s~Q�����^-�9�\f�$�*�9D��(r�c+�CM Q�r��)teϞ��b�?+o��¼G�Ν�v(/�זj�-��OLj�.�԰?p�Y�#�Ei�b�&ܐW�9���#5V%����߆Í[t�y=�Q(�e�Q�
1dG��je�1�9�(x�G�B�=Ԉ�,(8��|�ژ�uT��l�9�����z�����촿����}�t�^]�}�#��/��eer�������֑���:�(	z��H�\�s�n���������_�CG�}���	+���Gȝ\�R���g���_��`s\8P��ӹ(M��u}�yA�5���9��B�PwV4�צ��-ܵ�Rq=':4N�oT�,�n��	��g�g�ũN
��ڋRW)��>��|�(��f�&�:Z��(u���y�@�g��Qd��];뙶������� �c����j��}���omg��*Đ/J���/�1_{Q��t4o�ȇ|Q�	ܰ��5�z<Q�Cn���{f��Q���Q㝦|m;�7_��*��8���˩(��"�Eu�R�|��N�E�L��˾��=�p)�����L�w���s�`c^�X̱#����D����@��(۽g���~��N��w�E5e��f�u\���ŪM���g��<*�����%�5��1��p�g���/ʧ��`�V�S���q���k@���_o�~w��9��w���}�_Y����ٰ�s"j�wۯ�����f�~���Ň��:?ݙ�����(�ZO��@��F��G���~u�|
�<"�X�O���Eѣ���Q�P#rQ��m'+�k/Jc�qגOt��u�6w�#P�󢔯-���B=���Wlԥ3tB�EqL���Q˝`�����5�����Ey?2�u���)�&�6��r���QǙ�P��x1��6G�@��W�=�4�&�C�K���a߶���?�kg�Ʈ�#�^�˝b
%6\�x5�������ƻ�K�(q�-��_ܙ����y�o��{�>Xg���|m|�97��H�jb�U�Ȧ�_�;�k�s����ou���צ(NZ��M�=��,�$_�j��gxQ�E�XΑ�!�yQ��76��R�k�,~��@�T�)8���a�ݏ�F=OZ�oŪM�3<���(��(�uZ�c:j�מYqo�k3�Gaa�z<�C����DwY��9���+�\O0C�zuZ�S�(�l�-P���Ů�;��k�{�C���1�#�6G1=;'����/:g�ڊ)�����l�P���u�O�C9VE��_[�.4�m���g;�F]���*v��r�
V�vN��-�B
'��53 y�`L�~����Y�wz�'jh~��_����C��EUg�����!'(���5B��/�}Mg����������LZig��/�6��a	�6_��1;� ���K�(�M��؅{���y��	k�ae�Y�鿨���]X_x��6AQ�?����}T����ǆ8U���'�/����`u���R+���{���/�����1dG�3[�1��+�k��<���uȿ(��72q�ܯ�2%5!P��䢦�~��@I���_m�����WO��PԚ4�+��/J{u��³����W��U5I��gY�s��P��|Z;�L=3��C���*����|m�҆&N���~fz�
��R�cOxm���8�:���ԃ�>��z��2uı7����x���,St~�Q�Y���T��]�geqL��^�f���g����ڝ	��sV�Ϲ�)m�y��1/�(J�]��s�E2�K~�=m9Mn���	^ܫ^������ȋ�&��\�C���yw\W���!Ƿw{�s�,$�řT�G�t�,�c>O����#�k��b;�r��ϨMv*{qY�n�őDY����D�U�?·���!�,z�ۇ�G16`��Ck(�kQ��Ğ��zv���0�l��=��&�������˯�˧:��fw�9���L���&��!'�h�m��W����P�ݛmw�{�!kh�t@G�1��I�Z�{�Ғ�����d�#+�u�R�B��m�1[��.�6��e7�p<�}���Y���~8�[���}�b��X��aQZD�Q�Y<�L�����S����'(n���i�?�:��la���a���LnU������EX���{�0hm��G����a��M��h��U�K��'E< �,,w9�*1�"�R�0sN���M`CK�[��*	��`�*�������<�"�z�	ۗ�W!����G��/��]�5� ��w ɀ��S��y޷� qO�-�K����$&q�Vo�j�0�-u��ԝ�3��Y�**�1�S q��Ü��=-]�sC�ܦ�[Ko�#�˾��$7wy�?zn��,���ً6�3��ur�,`�8�&sp�A�^o�Ѧ7�8���1@��o�$�7?��uE �-��09_�Ӧ(�}7W!2K9l�C�mMs�Z�� ����>ަ6y�����|[ږ=;�A�XVG�J�M#���TpQ�*WN��t��`��#��Úb�uؐ&w8�m%q��`5��U8t���t�R��'��
���SRZ��4u�2���&�sѺ[���2,�M��y�v��]�M�q�e8J'kdw��SX?�挢w���$�>�]Sex�VC+_���R���
��_p��O����)��^�����3�o��2n��L#�,t^F�E    #��V�S�7,1;Ԗ�s'w�.�h�4�-X��ʹ�ԙ�����Jo�?�o�V 0'��U#�8��Jnn+��)'0���$c��WvHS��lO�{t0�m��i��T~qk�("{���6/LmJlS,<3�J\�|+�p8�JY�m�po@l_�,��T�z��
c	/Y�ST�w���PT��z�
�C�נ)5�~}��|���/�X��� ��{�a*"L嶌�����[�]�U��恄��.X̻����)�
20��_z.M��)bo���w:Ogf�U��Ⱦ�:�za�,�o���-�c���v�īp�4�'9�?�TT�K�7���ƶ|�|����g�}����]
���G��F.�~��whg����`��!�g�a^m\�-��Xt���%+�/L��3�t���_[�,�@�۽�:[�^;����r�7sMc�+�A[�vȂc��N�)�0�M�8�[�ӧ���'�>�����S��^����Ge��S-zaW7��	�����QkZ�m$���O�u�0W�I�zK��Hz��xP��Ew��1�?����������)?�������������������'�n�Sug����;ǧu%��q6�n�R�w�����9�>����cG?z^��j ^���U�T��莭F�g/\j�a�e���x���F��t餴ԏƌA�5[|��/�����¦6�&z�%j�y�1�I���8�LdU�k�x�Q�VU�tg��ۖ��jta��q��������0�{p0�P��*>�zrd����A_��<N�x[v;W/�g�.�H���,�[oA=Ϋ�zt��KB>8n���9�QFW�Qb1��O�lq���2���,yV7�8|�� �(76��r�<���|:��Q�0�P���y�EQ@zg3�V_�&�Yf�uz,
�����'��Q�a�aMyW<m��'�w��m�TDǨ�R?}�z��鏥b0��A�� �CV}���痶[1�#O�B����ލ]]��X#W��K��%��k:ta�[���*�9y��?+�@�*}��X�M箎�˩���\�,c�e���#�tH�<X�����9D~�"��״�����ږ#��:�x�	���O��X���C����3C'߅1���h^\'�t���+�9��v]l�-��|�A�%A�+r|�+����EƄ���N�)y4BV�a�Ef�\�s$��0�"�D��2K�0�
��Œ�����1',���[��.N΂�'��,8�Cc����:3Kՙhb?��I�t��
����q�/��Y/���@��T�sK��:�ۅuՍ7U�r�R��Mkz
�3�~a��kl {Y2�����,է	�U\�٩�U]� �<�!i	�_~T5tUGf��BW���R�߹�u�0p�������;��}�bMK�օ1;�X����;&��tRR�+v)	�9�24���57Ste�h����^PM��U<�M%>EÜ�l�:�/�C9h�WZ���18�7e�'x�9�)�P��;�_��ؒMo�&��z��Ʈ�-
Xz;�:C-��a�o��yKi���b&Sw�N-U��%�!�|�|����-~j�����9���nx��s�kЇi��.���S5�ڃ3�K�6/����)���O�k]i4���*���?t�n�#A�LX�d���V+`1�Y��u�T,f<a���X+�i�޴9����5m%f<����rZ��6�T�0������0%��X��ԛ:']��,�`�Yv��.qN/�M~#��5@`���ga]�*�l�l� x��]�cb!,V�
6|�e_�ѼV���8���[,�{�/Gy�IUBX���F lWRᰊ){�����jt��i���E�-n�#�_�����j��[ey����ɍ��XGO�%w�RE(��9����SMhb�Z4�[�΂�ڸ{aK�?m-���r{yq����j1�_�_�_o�����������00�����o�r��0��a&��[�����0�X%u`�3�5u�w\{��v��Ì&�6�1��e坜��jE�1�Ծ�p<9��k��u��� �ۜ�y	@��l��'_�!�Nc�5��G%0}vp��	���n�n�����σj�a�_b�$�bg��M~��M_�_��"U�t �;�Sn�qV!�Ymĳ���j��a���X/l;3�~�Ŗ�v��H��ˑ�3{/����H[7`�_̜։2ܽ��֖�]�	ڧn���`snז#��N�e�s[v$��w��H1�\,��s���6Y��,]��e���v�����0'�Fe.�Ū����p���^�6R�Q��UK+�Y,�o7J@G``��	���P��>�aj8����[�{�#L#����p���b%L�m<��gm�b-��4ﰯ��X3�%:L�0�Um��S޹�b�gA�s�?*V5(�N�z�b�M���Ã*������{c�2`1����a�T�|���<Rr�i�ֽ�6��66���`��a2��T�����D���t��m��_{���5a��GE��q?2~�;��e&Li���
OrK�@���
�
'��h:��s��;�pR��|�C3�g_uJn����6�.ʕ��9����	����a�`5;����֏�ͩ��ʽh-~�|��T!��>Ay�V��N��4����4�a��-��0���8�JO[/0u}�2s�G�h�L�*R������H�So���l	q��vb�d�Ca#�A-BX����d�^H���0z��%�@�;��~��od�δ~��>a*���1;:2�;g0]�0ܗԠ|��6ś䝿���gMvl�S0�i48)E�=�0��^�w��Ïjh 3w�G�Ś����;������iN3�q�U?���g��ao`�*h�#�t����*8����FX�
[��ͬ"[) KW��}��0u�vf�m]���Xt����ٚ��^��F/��i*g-��������;�wS1���j�?*�9�s���
�_`2�lmΉ L�T�(����>�7�-M���|������%���.�9�N�`�a��5��p����ZS9�j�G�r��w~jr'��X�J�N�b��`�-ɨs�vH�����׮�i����2K�0�nr��Ȩf�J�9�x�a�
�l�Yu�w�a$o��d"��w~ꐦ<�<�>�
N,��x�Ͱk�\(����64�n��0��N`R���a����/ۿ	e(��)-�ņ�/��xsɔ�=fy�7��7�ez�h#�k���� ����Y�����[��G��+,졉2Uh�{�T�y��L��.�ٞrSX��XQiK�,����bG,;��n���aH�y�=�ad�L��%��Өh�Vt��w�`J�r{q�F t��ꕞ��̈Ua]�0G�E2JX%�!2��8Ʉ�Wy��@v�!���p>��"#Z���ƺ��xH��s;��Oym������&�`DSn�H�H�^�lR"Pv4��1�ږ#]��Kవ��-��]�%`a9D�/�VA�tJڒ!�r�.�vȸEw�o����i��
^��9�n�3dH9���F�n@���w���c�<�~�U_�Vt4Nf ��(�t&���*az��/��&�{{$��/�����"��/�fL-]��~���1E�X�����_�����>��þU�}��k�������Ɯ�o׆9�ݻ"/��zjK8Z���JW��AM�J�/u߹=`C�A&�HeE����W�UZ���k�8;;k������0Y�4��w��l���C}E��q��`�v�{o��i>����]}GI0�zhK\��{�;a�!$���J|g�qr#+r���}��7��;�Ŷ����x/鐡5�j���cc���[���4Ƒ����6:C}���c��0=EX�/5M�x�SU��a>4�U���Y��~��$�W䖶8"��h��QR�A�O8�R5�HT��S�T�Q?��D0Ί`��r��D�R�(NUY���u5����H	FNP\~�E�:���<��:��ظ�Y    rN<-�`^�;�N�_�B��P�#��v����O��!�����RK�!#��0.Џ�8�/�)��s:J��8l��� m$S�
�KT\�����|�s��m��O���SM�c ���U���n��G�=�vYcN��j�QcU�����j��5�x~a���۹����E������w|�5T�;<���R�𭸦��>�vgj�_�75Ώ�H&���j�򝳧y@r����H;N�ۖ?M����}�pi�w�`
�.�b��ԩ��`{p"`-���vj�\['����T�t`ɲ�h���i��V̳�4f<���
64
$�ٶ;$�L��w>���u���-Z�;��+�O}���4g�9c��=�_�%����U��c��f��������Y������~d��*�<#ln���#��܋� ��m������l�[��;��S�\E��/؝�H���z��t_�R5ܓ#�` �G��&�v&v/�� �k��8�{��P�P޹>��/{+n,�FR�m��V�R�+�0V��i:�#VH��Hʲ��l2��<���ib`#V��ows����s鿉x5tp��;'qA�V��F����RL���a#9����@X�+��V`�7a1�����Ķ�ў�S����jbX�G�[K�S�9�&���ӆ�tyG^��;|\�w�i+��/�����"�����*�ғ/���
A�0#�/��<�b�CS�2�w(��M��S	�^���;G�:_s�0x�A'KaLl/��;�0�
NV,�����ꦱ%��~�0�e��hc�^�W�dߪ/���/���o�	�Ï6U���pD(`��aj�u�+�T/L=)�V��\��Gm�?�����ܽ��1v�p��N��^ˬu�;��զ�zRO�r�i�.�����tR���Q w�-�{�i'���;�՛G^�ةFR8��a������	L,Pp����3ؒ�NQ�mg^aΠ�Wө߱��a�4Vq�f9���I8X20v���%�M?V��N�v9	w�H��l_�Ta���ޑ��.31�eǽ1��)��ve�ʩ&�y�v���Y��O�`�-4b���_rM=���}�Ob�{���y0=��*���1������*2������bSHG7�|�&��=8ˏ���mtgk6Q+X����RYw6R둾0��!Uc%�`8L�V=������0Ā�ϒsg��,����z��UP�ͫ`o��mc��B'�`���bR�[����}Ip�4�0�#�U0��79P&߹>�b'��}
�#1 ���T�Fv/3ӏ�+,�1��M�j�;?5y�u5��dY��c�f�@��>Q����Lb\�0W�eL��;l���u���H$���%X����	��qrK���;|�#!`kV�ҕ�Z$���lI��nd�]$��r#�wwVw�3�@Z��ط)���� '̲S�j:��m�6_`�(kw:w�s
���
[�������pT���|�g�ɫ�*	|���b��,t����%����
����UMg=f<�[�f��g��z�x�-Ec�G��l�'�K��Ņh�3�z+&�~��H�m�ܚ���L���f�N�����(My�`q��ڨT�(�,�ٶ˞'�c仍�Qe���X��\2a��ʾer��rw�Hς�����I�zZ����M̸�R�v��r���,N8��q�se�a�Fr�����F����eƉ����a8μ��	/��#�&<l���!�6�h����>��U�gqy��Yd`p�V�n3q,��&�76PJ#Y�
��1B۪N�E��r ���?-$��H�&󎄭w��A�E���A՘�hx�������4yW���X9o�,y��n5��z$���H�Ų��fzX�#&(��YP�9aLA�-r!����?��oT\�61����/�;8��a��aݫ��9Mx��[��28ق�LN���z�)�3���S|��]^��T#��c8w��@��m���ŮN�:��;+�#2���S����A��xdV���W�q�2�ϲ�Z��F~֬
o�
�H/�K�Pd��O�؟Ź`GqK[iLu+�h?:
Hd���8�e���Ym�c�{�{�;'���,�*0���O�_�Qrj�澳�X��T�o�＿C��P�徳(aM�T��kI��]JX�ts�#�[��l����S�ck��\��X[�	��
�-w��d-�h	�����~���a��6��Na���G�vb���D�� FM��~�M�BRRP��ёÚލ+I�j�wN~�0�2jB4��N�Ɣ)�Ŗi'f��̊]~r�#`������Z25��ɢyM<f��ˁ�ƻ��k*=���	���v�YY�F7��i$���5|�E�s�Ү�R��r�n#�g�r�&0B��T���͛J����5�	L��6׾���1c���mO�l��i�sc]�h]_�ey�&�?�(@4kv/41A���S�a���0l�CB#
���<�-
ׂ�Tg�<vk��G9��6�wN`�Aci#UKn��ik�
D�����i��������<�+��y��ʵM��	���&�<��Uo��ß-�lk�xke���yyA�Î��A�)�yG�i4.�!����ɺ���)U����+�ئ���*��1�?ա����^�7[��-qa�j�|��+,ּ����� P�h�;a��%���"��`N�U�x;�Ym�ߒ��G�������0����l���L�"O�a�wn�GY�MB��J���Sn�1c�h#M����*�m�#�t�Y��\f�Rmu�Hp����wR��5�o��0U�v[ӻE6�_X�F⼊:Gd�r�7���n�)�y� �&/��[�`1�3�CO�k��ο0�jJc�`&C�&~����r��a�g?Σ�f���[$P�nMٱ��Q���6HJ}��*��?V�k#���3U$P|���1-�����V��u�L�l$��_O2�!�i�v��2�M��A	����r!�����شX	��Q*"����fN�ׇ���!��[���}KZ�#9l����*�}�b�k�S�~��G���v�Z���y�q��s����{�5�}��%�S�����Q��t��<���LS�H�$�`F��y������X�����(�D\9g쨚��_5�]53�ٞ�F�JS�t͘�w������睟OO#�酉�Y��y�9̛��8W�KV�L�;'O�oؐ�!�����6��B���1�1ISM�.��iY��Tr[�r^0E D�'ݻR�$�u���V��\�*��Q��ztN}U|Z/�z\�.J���{�U,��Y�����j�m��&�9��e��RK�"3ϼ���S-0������b�d�����[*�-���Q5/������Mς��B��Y�^��d�$����ct�_�7�V����Ɣ�|�k�9#��PV���Ym�7T�t��X'�����,�"�R\�;��&���2n9�wNa�kV�\@Xd��_>5M(@4�+�y��-ܵ�����eVT���H�y"����>�偉��	;1��A��m}B�����2�.��Ub=���!V���t�w�F02q�����(ޱn9�b���\���{��Vp�i1���с�=�K�',�E]�~�e#��2��"���Ne��'�*�c^���aӄ`��\0Տ�)�B\5֩�;.�I��K�VM14�g�#~˕̨��I��0��=a��dީ���K�~�X6�@J20�����e`�	�-��%�9���T�h~��va;�Q�-�lg0�л������q�[y�9I��6���O���ԓ=ok/�&����WX[�ћt�j1�=o��f^3�J-�l'O�^� U�j1�9o&�e$���})�.qϤ�UT	�C�V��;��.���'L}m�u�\z�?a4/�?X��9�+��2)K�������~�<���Ԙ�.Umr��;~��J������<��6�AFJ��W��������m��^=���`>��i;D~3g;?��~����۔swؿ��Z�#�.5��6�5"�`��h�y��U�9��e����þFdl�������:Y#f<3MeEm9"�    �T��:�T��������v������g�`C1�����-sni^}��I#=w�ƺA��wV;�"�`]�	x����2�x>ޭ�X�%:n	,�=��u5����0P�zr�.�ɠ>X��U�GFSJ9ʕ�lOrUt�������uy
�9���sӴ���Sg�݅�Fh����K�K#��Tw�B��&58c���D�A�AV����Ia���W��f{XW�j��H����:�K݅�AV������ ���Ϛq&ψ��]_:C�a1�Z�� /�&���D0g��D5�j�ț'XW���s��G̼��t�9�;��"���s< ��֊���4��ﴢW�;��o��s�gaŌ�`"K��q3=-f<�d�.�)�ɓ��/��z�	�"K��4fk|l�X�Üf~g�'�ja��l$�갘��<��,�2�� ��7v��y�kG����EsT�g�ڑ�j}������&�� ��T�cl��ܜ+,>͇�kEV��ί��kӏƎ*��ct�˒�R޹� kӍ������8µWuO/�;?O}��Ŷ��=H��;'O�d�a�(��Ԡsr!���#�<�<�vc���Y��lf��,8���;?a��l�Cz�,9�v8^VC�։݅�ۉ&N�����^7�[H8���N�"Y7�˺A潸�'2y����i���}n�w~ʭj�`�D�Mwl'<�_�hXөa���{�aJė�U9�K�]��7�
�XV�����:�#�0�m�l�;�SXx�Q���W9a�3���<�m
c��9s�N|����#ӏޭ���0�u�"4�5F�0a��1 ��;g0�k#�?�}��#�)z�x�^���FX�`���]R�[5�=��T>Ͱ�,�����
��J�ܲ{�{��h�O�*�X��n�ɽa���Z�TaF����g�yN}�&)������)��
"��M���;?�^-?F~�;k����
ɪ�L[y�Ip;\�i�a3T�����&�E3��+,
d���z'��n1�!�id�>�b�[�`����{K���X7B�M��:m��w~�~�JM�<:Y��'Ƞ%����V�sX����]��G���uc�t�����q�q�����Ѩ��>u�m��A���=Pp״C��u�yY�7����#�_X���*[�����o�u�.�-�9yZ���-N�=b/Ϻ��l�'0�3��ׇ�����}$X�Su�����mČ�a%O2b~a݉0�h��#�F��E�;�Kn�&7�`���w�al�VX󳓚m�Mo�){��wN`ζ�S��bo��������m��p�H�D_��wnq���7�Y��,���mL`���\,�sy�mL����b_ۺ�	82�m=-��o �Pq�#~{�9�Q�>��U̳g���y��DX�"����h$���y���մ,=�X�z���ԏۚ7�Uó���~*�q���ȌUa�����"�Ϩ�rcO
y~���i+SCv��J ;���~1V��*��H>I&��J滥�3=b�ΩFTo����aa��q�m�mՂ6��H;^C�{E&�u�iE�3��,Ģ�U��B|�w����Wq�{S��{�����P�se�}��R��y��'C���Hv9���ʤ����'���_� ,2��0�����u��Xz��"{�`N��7����y���Ԛ&yg��̕I�D=-���g�c<u}���/�S^��8a�I0�G��/����9]�-�����۹I�cN��n�9�*lY����}�����GEf�����{�)��64��t��x��dUE̶�l�0r^uӚz��y��w��1�FXdxvXK|kf����u��9'��4���y��ɣ<%V��/�^�j�)1��.�&Y{���Y"4V_܊R���,\�DUtJ�c���ړp�9L#�')�+a��S��� ��v�)�O�a�֩n�'��a�AEL�.^���:�u��|Ф,�#����/fH�G-�O͢y��!$�a����Fj�`T���ʄ�<�+��/z�o�$5�S�p��+�9��.�j�(�'d1�_���GpM�w.	l��c�[�v�-��2`E�j�K#�`>�����^����~�˒3�a��P0&�T�Ԁ�#��o�`+�_�j8���U��ߟ ��|\�G4�Gy���`J��0��H����,D$%E�O�/0�p���i�,8l:�*i^	�aM�� WҶN�4R�Q�GyX�˧���6<��Ŷt��/�Q�3�v�w���j�(CCSq�����)]H>��{,����H��U�p�;��:���Xsm3P���O�1�/lT�#5�-��_w��|z����B��0X��C������+��ȃ���c�������4�Ə1�{��a/.���3^V���ƪ�1�	��y߼LS��In#�΂���i���>��޷�\ǻHΈ�¾YmMS��CR���6,m�(���y �i�t�<G�s3���k�ue�6�*��Y�0���7��L���Jo�x�9�Q���t�-���V�ͪF�{Y���G�����������TG�.�ʍ�\aQ�t7ye<�x���i̎U�� ����;'������|�F���H�R��9�ø�P5��~���<���?3N���< ~�99}�Jv/aj �m����_�SG|a��>�$:�	��k,Al���_[h��#�{<kj1�C�w��l������sm�u�Ԡ"~���-��KIGB��S�7]X�rP��tVd���f5ה�r�
I�i&�Uon:+�`|a���G�ͳb�¾������6iqy�v�1c�K�Ύ��LM�S��:;fy����,�!���c�v~,U��ώY�/�Ua���<w���6�:Ύ�H�}D�Q�IfT�?e��pj�#�9<�޹����Ym�M�znW]$������<dE��"���	�o�ɽKWz�$3��7��6�����4�fA����x�v�55���G�Das����E�%�9��d:��D�_�McI�����3�t����b�����VJ�`|a�����ڔky���$9d+I��?�űS���]�0�`�kL�b��z���d�n���Gɳ�lk0��
Jo�5�v��̨ڷ凡��x׷�3���U��M{w���8��s��xL��Vo�Ua�_�C��Q�5V�9LU��:)��g{�F�A���&߭ƪ�})�wn�n�}�rPƓ�t�� ���¾$�U)F����}a8�l�E��皶kq4p�;?���F�wnYp��J�8N��J�Ӥ	vW�^V�Tr`dr�b�T#	��+������������!a#��Ƞ�	a�#�G�M�����}[W�����8�R���)�e�	ۙ��ח�M���cM)o6iꞖ@T�]�'tE	�56���\a���r^����w�&g`{��U���4S��Ä�h���q1=M�0�~t��h��m�f�%ؗ0�W��(7q���HWۇ�^<�9�]��8������[�Z!����'�58���2)θ;�k��#^��w+l�&,v��뜂ѻVa�I�SL�q�>�ec�0��6Cq�N�"��6�'er[��A?�x6�3�afTL������td�*¸�b�m�$�8$��K-U���twmK�u�_,Ґl�z�3�h�9����#	^Q3���u��FHW���t;�w^ϥ�N��l�k�����SN�cӱ~4���4�p^k�\a9�}m��������?:S��a_
��ڷ�L�[	���qe1a��:5�8'7� �w���6�a/LjT�!�3��<wUp+	W���@q<�4�L5�dڋ��Vs����4������שOfT���U�nl+�w~~�r�Y졍�b��`���.�^O�y��H���NX�_����,s�1���[��2WV��$XU���e��ȏ��)9���bӡz�1���szZ�����@�������<��l�s����F0|8k���޴�!��T�M��E�²U�I����ao��ʞ�D"��&�޹�Z�5�@����o;δݷu�-�����3�����{͝���6e��A�=/��#    ú6n$����j2h��R��N��ٷ��s<�(Z���:�rN��&���w�J0R�fvir�_`�����	��<��AY�-���64�s-�**���p�e����N�aZ�Yp	��\��xvN@��V���v�����J�j2�J����I�EX��`>ɚM�\����)�k@'��?<�sG2�Ak�K��\�L}F��y���_8wf9HM&�D6���`H[�dFչ�76�s.�>!2y:��l���Zc��|k�R�}�Z�t�/l��k.�"ɹ�&�C��$Ti��}�����
�X<�t�=J�֝�y��|������vo�����6I^���¹��TE�E�M0Rt��,F��(�"�JSv�.<� ��}:)^�;�UpBX5�T�Mt�݅���d�)����;ނ�'&��̨r�����C�z���KU(N3oBES I��a�H���[ٗ:�����,������D٦b5�gT�ӽ��G�_}���6�s�ѼsGH�̪���h�`ccoPn�aC�����e���s�F�s���#�S�0C��\{�h;��I�z�5'l��E~$�T_��\���}���*k2Yӏ�|��~��1}J����`����̈��s���
���G{����a֚&��&��qr�,�jέdf�p/��y�-Q�G��� ��5��UTiJU���
�"��h:��uw�V�5�ߴ�5��t�{�C,V[-̰�a�����cL��~N-]�e�jc��~4���5K�mѝ��y���]�2U��gT%��Y��,zm��jH��t-7y2��\	:$F֗��L����C�e4�{�DP6�q�?���|�SSF��'�.�����nS<f��2YXϾt���0��j:ܾ°C�e���|��<��>���������\	$�`�ˌMM޻�H>��)^�Lm�&���G�����	G�ʊU_�}���	+208L��WQ�w�:�C�Y%I�]�Җ+���m�f�>���\a�iM$����U���������b����l1�s
�����&d�l l�`�X}8-�t/<���§!��wZ������m	O܍�k0Η#��
b�,��K�8ܛ�X����im�^ر�\j���f�02ݱ6�r۱�c[�A]��s��(���wN`��I?���c%�Ú��ƹR���U	��f������B��f�=��z$�9i���b=��R�0j2*UO�G��X���i�h�G��8��������9��CL����ؖ������$	n$H�\W��_�)>��X�>sD�0Gq�)B� mT�>a��i�#��S� +������|�U��E�%�	�Vf^I_����N�}���<�X�k!l�Q03�$a��y�;+�P��OĬ&�Ȭ̼P1��A߿M�E��ǩ
+)p�FM���r�t�a�/�^�Rr�`,�C��V�R7����l|�^�3O*C�"���5�fEWJ{A0ϰoq���`a/8�a�&��m!� �����CGՁ��UK�?5X�TV��t�i�[X�vv3���y���#�$�+���/0��gj�xV�ޮ`�H���_���QzM�U5��z�L�r�� s!�|�ɚR_e�;���Cǭ��t88��{EwV-|i`/���~���,γ�^�N�-��L�8��f���f]�p"	Fp>Q	#W��Xv�]{��eS�j�ZMgj``�V$;��������Ҳ�A�`\���̯`@B~A0/�RIU-�����_o瑪������y���&�p��t;��I��,��Bw���}P�.qZ��_��Ġ���!��Drv}��a3��v"~q���Bj�v��t8�\/���j�@�n�+�9�Rd�}���2�\��������)e�)���^8��2`��J��mJ��T�0+=X�F_�T�/���'5�5=X�?����.J��K��V�\�ӲK�?�b]B��`��`MJ�s�ƚ��`�Y�eK�S7D�i�`�R=�E[�T�y��,�;wF�Kc��f{�,���k�0��a�,��YXT&]�}͂�yT7�ـ�k�7�+�/X�uX�e��2 ���e┶��fz�j>M
��3X�"1ةu���Bf��;0�4�^���y��4�G�v��4�x��
=���xi�C>e�*[2/����!�L)�)��������ǳk�jN�����ep�x���u�gNr�w���f����'�`�J��~�ܱ�BC0/3�Ѧ����ST*U�z��yU�@�M!�Bm��T+N�F0����t`��P���7��~i;��Ib�|B��80r����(r�9�S\�~���?�j��5R��P	#�Ѻ�{Rݘ`�ul bn�"����V���;v�Y������Z�����8pc�$�X\��
�\����6);t
��tv��^��\����y�-69�޼LV�]m2Wj�;�j��V�;���M�+��|�Ȱ�={`�����Sۊ`�j0[\�]e$j�1��DZ���o^�,�̻m�ou�	v��M�
�v���b�&��f�ո�s�C��Mz'��I��Ф�B��:6�R����K=��U�EUXu}�at�Ue��`��a5{z�nf!���sA1sP����8{W6J�2�fA��.�2fN|6���ѽ]l�q�w���.����;�`�����j@.�s~lrE��Cu}����rz�@'%��fa��Lb:T�:�k0���Vt-������Z!��^0w�Ż҉�V�پ²2�[J�����F߮���m���ᬧ�;�e�<��Û�P�֗^����d_��U!���LI�|��\�k�V�Fo�u?`���]l������u5�?j�Ѯ/�%X���u~<�s����dubѶ�ĳm��������^�0�IϢ��t��+�t]�2X��i;��)���;�`�H��<xi�}�� \s�Uw�H5�sm�Y@aMw�U%�k����&h�ֿ9�L�G��4�-k{E������k��K�{����5�W��̉fa��C�?$9S6�~[��_�R5�}Ú(a�����-��T������7��F��y3���F |qR������V�L+��r;ǧi�g�ؕԨo���u/���j��+���Bj

��������oQ�������&���;�8��4ko�c�W��/�2wv6ȹ�c\>�O7sNh6��v"y��rFU�`��ۼ߹I���^�w�3�2��KV��F����Ǭ����|�����S��Y�_�1A�sRS��|��R�nk<�}��g1�M�����-[�A����~0?z������;|�@���"y`NP���ۗ�W�M�A]D�+���i�Xj�<���|�)�-�|�^���U�:6��߰�G�$6�s���K���k֫*��,�J�/��j�.�l��4�U)>�;Wwǳ�Wm�F;y����F�9�9�K��=a��t�κ� ��"������4Y��v�!i�W/�Ә�3���˖~��'>�K���i��@G��szo�K#>�
lܟV\� ��b��y��ԓ��E��S)�����Ra!O�0J�V[�e<�sE� *��d5�;ǧ5,|i�`׽ॶ�z��Q��<�ú����e�������In�X�� �i>����{!sQ*Î^���}�A��CFc�+�2�j�Kԇ(���{g��$��p+ZN�߆h�G7_F��-_g��6U�EAl�r����O�-H;R#�v���Պ��bx��*Z�C�؂���"����2�1ko�������{�Fآ'%��N��	�n��l��;o'__&T�"�֜����h{�䏧mŸd3*nٜ+�=��6.���齐��S_G���s�]ar����x..��`H��֋*a����4Dr4�7��>`bx��9-붐�9T�lb�5���-df��o5}����DwV�w��ɪD�(�*���w�X�͊V�����X�
�L��'ԛ��-�*}�9������0q��JG|s}���}���&�    �fW��Xo��{/T�����>f�k0��4n��|y�KY%3uԴ�^p�i����m�[Ë���SZS��L<�Ҿ�
��־aٖ��I��)bo��3�:Dcl:��s�vUf]����u(�v~I�l�Dy=m�k�u�a�IT�B\	Q)�7�w~��1ݕ�'�k�0o�2�^F�8�ä��@�f��*aX�.��7[�y�OpRt1	L�6?�V�6�Q�����?w�Yf�]���y�����q�`�����d��w����6�4T���w��E���S�������j�N�/�w�o���֠��~;C:�]�EwJF��O�T��%�$�c�B�yr�����'����%<����l��n�*߹�[L�4�K�vE��|u�`T�$�����y@sy*��񴍮����y�#9�,.��ܔz�;�Иc[��,d��
�(Ji��)��B#�m&*K�|���`˹9��5��^�����:֫r���F�6������Q\!.���v���>� �֋�#8?�t(��c��^K`W��/-�lQ�f�?���e���(�$ؼȢ=D�73D�B��{���R�~"y�9>�kAǲ��߶���(;O�46�{5�a�,�cTY:s��|�QRt
�y����K8���"��^8)��&�BҾ��#�����;�5�VG��`���=i���7��u�����{�@.� ��6��|�y���4=�:m��ʟv<ʎ����F�o�c�	�����}����*G���b5��*+=
~��x��O�E~�f��4W�9@�j#9�JѼڤ{��k�2��Y����[��d'��R���C<��;1���+,���/T���z{~�`<����C��;WX�0L)4����oOːY�?2D����{͉M|����a/�����sH5�ª�����`���/-��^[��|	o4��⪒��,x��=��z)���o�V��*z������q�1�$����'Lѕ�5?���zj舟{t^:/'9�Gθk�����Xm0�\��#�ѽf{X�-z��� Q�������QS�rF��b���d��I��r�5z���!�Qv�
����e.����Y!�U�W{�V���Cq�l|<m�1Z{������gW�DW���o0�u|�;L��]J*s��+NZ��,����ߟ���֢� ���g��"�����3 ����K�'L֠���K����>ڹ(��l�s�'���ڋ��e�&]Y�m+�2�����U�1�YN
�j;ltԸ���R?�6(�\M��l� ���I9}��z��ɟ�|CtK��-�&��j�����N�.^[�w��ej~Z��R��^!ܧ��s�[�Ϗ�Vh����$ ���mNy�I.�����4���5�G��ïeR�ҽf�
�R�� VȈ6R9�W������X���>����y�`�z���Qxڋ���HE����/'�h��m���Q��d[5�������s�ۖ�R$���V�K��>��;�9��Ίl�ūO��?�M<u\��;�`�@%?Cf��qX��F�HZ�3V��G��Ŭy��/�B���������[�$l�k�NfU�O>�o�L�^�1�3V�<0;��L��rE��e�ŵ(���U���a��-Hm_�f�G*�{���k��:%UK�-��OXS�͡�k��A��DH�`�����^�"�ԯ�{`Y�շ�Z��vE	r�|B�x��fW�x�5n;�_0��y��k�fw<A���
{`�*�,�+�KU��NU�̞����	���r^)��[��㴜���p�]���ؤ�ǀ������������C�"Q���o0���JC��w.��*?E%u������=-FJ��xZ��ٵ�E,杁u���x�ʉ�������m�,��߾69�*��T�9������E��H�Yp�]�+	2��<��O��,�������֪�ù��˲�8�T5����k+Ov��ƥ������LwS���y��R��a��ok��(���7���_�y?���>UF�ȱ�<t@�j:-�cF9�<]2���o�����������e� �" I���w����xl�{G�O���+k4�H���4`+�VF�W��k����L(��خ]�EU��C ��_ �g�1m���\0�QNeyF���c᫃�@�=\�*ªwT)�,fy�a�-��N>��,�_�%� -��T�b�~���s����[����^���5�f�[־aR�O���w�j?Q)%+d�|����}�TA�1^�;���Xk*8?�w~��q$�ձ��r����I��컟��;�aK�=�q#�<�W�<��ܥS+X��i@���Kc�Êטu"���s�y��m~�%�sz�!��n�P�h�&��*5��;��c�w���Q�ާ�=��l>aߦ�a��J���1�ZNp޾T��`����k�Tn��i�&:k	���:z��!O6s�Ӳ�oXw:(���<`���J�l|�6�����Y��X����;��^�x�ڞ̂�l_`8�VP�v�����i�$���i�מѭγaٕ��^��/V�3	�p:W��i������b~�<�
QR���#L����È#]`�q��:)�k��0Y\:C���YP�(6D����/0�ӛU�Z�o�)���>���Yn�	��U(��B-$|���;kwo�\�w�����(m�.�Sר��&��)��x[5��ȅZa�y��{/l"
��ll}�j&%�)E�9��U%s��U w��3G`�с��f>Œ_?V�򔓁R-�����V�ksX���~���c��K;*���g/�ۉT<��ݭ�Q�n'Rq�7����ۉTh%{��9wc�:U�%0���y�)��#��g���!���P�x�l?��hd6OQ=����_�����A��&��>8�w��u�fks�^j�F��[�<���,T�tƾE�
��Z��W���0�cd��4|xo{��ڲTh���n������KF_[
0�o�Vx�&��f�T�`
��sm�~/���m1�	�O/��2'����۲vRcz��V�O���^�>]���[}j����w���$!�'��y�Y��I��|kT=���o�n�o˱*����l���9VH>�6��mǪ~[��S���,�
+$���f�m`� �t�8�m�P�9V�W1�Q?�T&y����ZwQ���{��	Ӂo~'�2��t^�	��,�r����ړ��Yb_0�2�?����y�a����<u��R?`��wQ	���	�����f�0/VĶ�e|��
��`�&E�2q�fY�0��˶�o�mE�4 5v>0��e��i5����iޜ�k��Ru'�[�f�:���~��, gl&4��~���.�^�l2��,l��VAam֯Y��@;R}ܾfAZ��ŭ��Y�f����4��c<L�>�����6Q6��B���N|��~��ՊZa�
K�X��v��U�ҹ�j�5�yK���^�y?�$=���!������Ѧ�8�/yg�A�[�"�H�/ԓ��H/�-���Ӌ-��<O`����R(7A+����6y�0RN��~��s��mY\��S�NrE̦�;��io���d���b#y`�A�Q��C�O(h���&�Ǯ��������n�������)����J�4�eZ���������$4/y���u{���kܼ��n�-	VC��7�%����y�ઋ�~"�XVOӫZW���b�X�WO�Yf�Tݵ�f��&>sĪ�&�xU�	��i���<��~�`-
b<���w��Pɵl�[N��;�i6���cp����ek�p�R�=.���<���9_���L&,F��#�b�~m�sΐ�x`��)��ͫ�Բ|���f#姄�7�5Y+f<Fq�bŌ�_�~Ds��B=}��l��I��C9U�����z�{u���Ss���K�d1���+�`ԓP.(^Q�;W̵�G�F����b_���������#º`�NS�ێ��z��b�腊ܹ����N>~�dy�����Քk��g�m�UW�    �+^��^����nC)=w�/T��k����}���%��fs���Η�y�G����߹���N��&�b��aj�eY��&V���
+d]������d%mץ��/Xk�,��3V߰�
X��`v�N-˅����o��EB�i����&�����X��|yZG�/Rr+Ōg=���k�)�-�l�#�#��ݥNn�Y��Rى+Še�[/͑��>��Sk0	,�پ�h1Sq���U�P��Ҹ����ʱN��N[�����]�;�;��%u�+Ҹ<�|�)���V��0� �U����<�W�ʽ�.���ǳ�M��m�Àԣ]�����E���	j����񷹺��e�����t����e�<��@����a�[γ��,�|�EY}���~k�(i�7�[n�)� �R���w�+��h1[W��ab�$�&��;+:��|�*��sX��^��'��dɺp��G�f�+���Uc���a�O�1������%X촭�+S�+� �	�����L�����b�����>�9��v8�G	��,��V��0?�ym�b�,|簳(`��]ά�
{OV?q��Tj$X		�z
�(�q�����F0!���Z���J�$��V���?���fRW�j׽ LW[����v=�&�v�9�v=��5	��U��F���RQ+T�'�̂��Jo����L6Ҁ�f]j����Ĭ�sm?����t�R����,4���R�w��\�DL<�����9��9jN_��R�Ey�D������®t�￭�)6+R�u�;���_F�z"����W��
I�qJߞ����aX5�j+g���"1AU�ָ���%�ݛ��[����������j�p�+Ї���k��2�$�g�[��w����a;{��{��#�W8�˟0Bۇw�\�F��mcd׌�6`�80�G5W��{<+�!�73��{<�)#Q ��X�nq$���!J]��!4���On�N~�5��p�Ry��-�w`�	��m�>�V$L_Q�[�;_�&*Z�*RM�\��}p=���,�/ԓ��j���%���Y��oP��<��l�m�D�5�a��k�y����SA`E�h����0���\�$p���1X`���fF�R$k��Hz=�B������>�w���P5���v�k�'u�$�Ly�X���mՇt�z|�����b�,VH:���*�y�t�_0����������g�Η�K�������2�r;W���(��3d�[d��K�O6+O�v}�`N:gnQM�n�}H���lF/O�GnJ�/>���7(�
>!V�ԓ)F$n��K�1�<6D4;�:U`�L�j���t;��z�n�5�&��Τ��׶�i�����'�&b�N��αӶ�u�O���4��?�|
��ї�x;;lz}o"��s<��u�����x"52PT�fI-iN�<���Qe=�];�h�Ðk��N�E&O�Q䙷]ߚ�Y�~�-֠���h0��\䳶�lǗ:���2�v�L�������S��.���=i���&��n�v�Y�Y�����{x�S��:���	Ӟ,���]�h����ncV̼����F�$���ئ�9L�w>�LW0,�������Β��`1��hB������ʫ]��y"���Wy���*A�Xs���,䇗 �No�#ĸ�݅cd���f�=�I�.��w��vR$Mrm�y� ���ёu�-V�`����v}��	
騈]5ₕ�ZjO~Am�	*��\a�q����E�~;WX�e�7�Yo-F�Fq����Ym��S��Sev��0,CrX��Z�Fc�H4^�Cv����n�l�w���o�	Ml|�|���%�x��w~�SO�TQ��E���#���d*��{�l�'�!����m1���m�/U&�#��ZJ�}�{y��u���ۉ�)�����_�-If�t���/�]FJC�����nE0�����`�lF�������`S�G��=��j�$w��z�ɠ�]�'��
Q�͖Þ�X�Gd/t���vG�.l���A�V:��]�N��Rr*�v�w��h�1k��5�q/��@e�����y�;��:���^nѮ�X�}��l�og�P�V-��H�%���2w2e�B��^��Y5��vv�9��ӆߥr���׫�������2��*��%��7�FDu{E��aܧ�|l�C6�s�I>�LW�⥑�����"G�v�;�a.�:v����v�y�}3��a_����y�\�=�|y�&�/Á��,U�ҕġh�uԬX	�0�j��E�l��v&�&e�l~�V<��捘�ޱ��a��T<L�w��i��U���9��5�>aC��w��5r�D5��4�`�C~+F�d'���y����f���^�K�60�y����2;fy��O�G���f>�:��D5��UM)v�������^���O+l��O�Y���6�.����\���"7Xd�`
�ά�F����6�Mu�������î'RE������P�%����$r��X�}m�:��u³]S�]�L�yK훂1�ɂ(�*u.Z:��'L��]�m�]�|j��Ii�J��
k�Xyg{�Ҹ�;���y4�E$�4����-��ҀGzH�r^�Ì�b	X�y�e̕�r����G)l�2�WN������a�3�Ll�K�s{�7%�+�@�r��Т��΀��sv�/"�0X�_ V�2R?O���6�2�K�b���4��jҩ�Q�uw�nK�j!�;�aJO�!����`�K:+7DW��R�&m��E~�;��oY�ۺ�jVn+d��6��]�Uc�p�Wq�.���X�{��T�L�$f�SֲK�dQ�l��(�Ƚ͜|���U�-��I+��:�F�:yUX���b����Ԙ�i@Z�/ �k}�.^|�"lP�,�F�7|�Z\J^�����'J�,��&�َ/-h���kj@\��
��mN�М�;�`.`���͂��B����=$��x���R�#_�?a������R|�0 D	D+]�N3�-�z4���OMV�݅���A]�C�����#��R���;�b=R;�D	�B�����t-�)�n�qU�(®W���R3n�4fy���!i3 �g��u�8�Mg�ƭM4�{G�P%�|��"om�Ш��2WF)��*��<`�����k��#�`�Sv.UЖ��U�%���ޮr�y���!�g�����$�Y�	59_X���N�'��F<����mU�}��
 `n )45(��9����b_i�{����r5�i��G��~*�d��\�J&r͍-=cMR?��{���Q`p����1��0��1c����K�< 7���y�0���vo3V�8��j[�#�?�L�r6�]+d�C�Oo)�I�9�b@?Tq:㤤�Kc,��H�Z��X]+ƒ����ǀ\���L���|�\r��Њi��q�yZ<�~0E1Z�4�����o������tED�`������U�]����'L�ص���=�w�������+L\�+K��`�&�ڶ�vd0|`�*>�E�۾��N�6����UqKu��s�W����P�y��2O������Tu8�k��W9�&��,pӨ�W�eN_�@��<^���
͇RC]��k*���N�)��,؜6E8�`߳��;�u��gA���s���,�  �]gH�_���nU�I��f����7��/�'j��H����}S��`_� �D֧�4�B����f!�B�8�-�!��,�gmc����5����^�y����)��So[%�����d�}j֬,BN��}sh�	�|�f��7+D:U��Q {E���Z��,2������C�	.�x�������,]�j�`��6���ʰ~b�JV)ȗ����J�H/���;L�oqg �?�a��dU-	V>a*n3�V&r��w��'��c��������M6R��ð=���D^UQ�\#��S�u"\6��,�%��������s˛� I���1�2�k������5�o;Te���5X�fi�zU*-!�����7L-��<�i��y�kWGͥ��=;C�D�y�u/Ш�>�m2�W	LZ��O�3��?`���q5X��s�%���c?O?�~�    �����}�y�]E��p��{��}Z9Tm!��YH�j�V\2[HI�W�]-�f+|�ȗ���18Dj+X̷�����h�`1�����U�.X�=�k�f��os�3������oX��������i��˗��_0;q+��16ym���b��~�"u�AV ����	�'�؛���������?I2)�~Ú��?m������U'�v���)�
�D�5��,4l�a�{��������ײ`%�);����6]�4��p�'.��j�N�q"ȊWW\3�y��$��tM�Bf�n;�k�K��H���a�°�Ɓ���B��PIi��5�^ے�m��#����F?�x"���,�m;L�$��w�ZU`�M�Jѳ��>a������ۥ繟Yɽ(Х��"˳����J�1/ì���?V*&�so��l�c6��3�w��4�*]j�	1�0Tb���d���ga{�����R�=�{����[&O����0P'ɑ|r���&���W�pG���#���f�޶q$]QH]��5�S�AGK��3��O��58-�=�:.��;j0��(n3ܚ-˒���0~F�`BI1��0tm��[�����d`4Ԭ+��i��c��5�ƣ�(?�K�\�a08��@9�`�6��@��)^
�"w�x؊�f6�|B��G[�떑�`�`�2�?�j_�>a"w3�G�C�׽0�wW-Wm�i�=?X�H'��\��/p��t�-^��_�I�V�h�<-��'�S0�ȝ��d�o�|��������-�H���?M�k<� k�:_Uy���0?aj�0�B�j)���ꏇj�
r�w�R�	IcE|��a���i���$)eՔ��������RŰ���i��&Z1qF,F���v��T�*���`1��Y�ε�Zo
��l��(3�Cb5��ɋ)��t�ָ�����c_���|��|["�~�(�^U�X����rە	o�_��T<�����D�ǹ#�6�o��0kf�!,v�̣P.���Ŗ"���y��N�mZ��&�S.=��-��u.�x~�N|��'�(����<��{��0�Y�NH��`�������������*[�]g���J�H(�`�k��:T�c�lc@��L&j��p���+"�I-W!��[p�q;�X���$�>%�)X��&%�wOe�4Y�;����
DG��w��B}f[��Zc!��<[��B�8�v�Q��Us��i��=����:(�C���*z�o/U�j�sz��)�h��2bXC�@� �r���RO��if�1#vU�'}n{a��e4��0Q�[��w�?#ra,x�(��
ri�F�sXax�ʢ��aö�V1�p��^(����"�2lѣ�qR�(��N�u����W���f�$y`b�I������I-�FID�w���Q�>���S`�g�9H�<���{@�&��LU-�����h�o��Ÿ�;�����fd�Z�:�#�#b�k<�ۦ.�*n.`����H���,{�l��b�y=�]ڱ�w7X���r��sme�������\k�ۮ�p)�h�z$,먙d��k<�+��c��e�⽰ѡ��v'�XV���I��$�H?���f8�K/:U��SD9��M�Y�j��<�׽ L:��l.�V�a�h�-��cLuaB���c`�S]��ѾTr@�������eJ�ΐE�Lq��`��a#X<�<#��%	������Ii��������b�,<mQ�8��<}�&y����l�����6�����i^�4ke�U�ھ�hw�۞��J`��:�H?��u��jW��5���3Bv?�,��9���9����;�GJ�,�ݖ��c4o��ɑ������Y�SN/myʹ����(�T#�,��GN�}��� 6	3�jN�a�Ҥ��"�:�y:Cd.����$�a��'LU��|p����Z�����?���R��~�^`���/�9�w^;��&P+%+�D.��Q$��`-���ʞ[a�Z�~�&�)U�/�#����À�;L��
�`�Jd�Z��M����i��X�ΪuIW��ya�����Y�,�ya5�����n;��wP�R��K�y�D�*�lӱe.y�l�����n��7���CI#^sm���&x�u/��W�FB�`�Y �J�NǾȯ���D��MLP������9.�3V虩�z/����VU�.׮�H����~>�{��'���P<JҢ����A��K�׶���}�h"��%r��r���8�Ҙ�_�n�A��u�W��/0x�Ґn�`�ɓݪ�W�`�z"!�.����u��8Y��tv����NU�m�������IvK���&���N��iX��(bV���$�������Ø����Q���I�Nߝz�����{�+=:C�y�����,ya���ϳ�^��R��&���LƏ�#�a���l��~���-��� Q�#�^}��w�E��U�U=�|���`��H*�s�7���LP��B�?�̕I@�����=���I�=ϗ�b��
S��7|��v6������}ZՆ����|������D79���k��:��t8߼f�����L���Η�"�3RU��5�������5�W	>Ta�?�&:�$�`�0`J�t9�\��
Sw�*�5 ��/8LvH+��_�S��ʝ������:�s6�cJ��`�kX�zU9���0�)9�����o��B'�m�M.��銕���!�Ш�S��0N��%������ ����m̕}����ԟ���WaЍ������ya���d2�W�Y0�F%۝x��Fz`ґ�|��"�v��t��V�7�U��*y�v�uWԒ�����&�b��}B��Γ�����i���`��)E�r3h�!P�}�iWi�Ib�g�t������x���;�3��I�R�l;ly��q��t�#9W��!\��`����K3��J��-��`rc��s��9��Z~������rXT�K�v`��t!0emgI@B�5��<���`�;�a뤧�v�sm�/qô,m<t�����:���ڞ�3n9f�VN� +l��5���(�����kiS�cgHV�����i-��=_dж���Sh4�#i����U���f���4��n�Z�s��A�v�z�D�GC��`d<���Q_.Z��Su�-l�m�)��뤧�3Ǿ�+dd�]�k��ȩ�ȤP�b�j��w����/�k����>�����ꦩI��*����,r|�ga��}��2�5VH� �B���y�u���Ԯ,K�����T:�����B�>��R���5|�;�J>�.#���G�5Q���_plZ�
t4��0%�T�$X	+d��h�%��b�s�>Ov�;���O��yv�Y�b\��p�Lۂ���MP�FjN=���z���I�Q��a��u��k�-r���n����|�zd0tX�>�*��B�9�q��K�NUa��i�%�4SRIU��ΛP�2aB�p��<3)qi����~")�o=2�<0��ъ߆׶#l��v��ya�Q+N�>�)��{�_&���j�G�T�u
f�Չ4�����ʖ��-U�1�K�ڀ#F�~�mW��������g��]�r<�k<�a��oJ(���������Kc��PS��N> ��07̒h��Fd�}`"K�Ҷ�Թ�#�yhB]�z�sm�a��Mq���K|�0��%����>�NTQI�f3F�7�Fo��|B�k{`v��ɻ;�����D�"IB~[ԩ������o[�;���lK{�vp��ɶ�r��<���{�XK�{,��/0qjn���4��Af+���w��rV��4D[1���$��R�ۊICqМߧ��|�!�"��w��W�Q;�X�x�?���M��}@�LQk�����;�H��bF��y��s���܈7�|<�:]Q�^����B=��.��]��'R=t��I,.����\c��ݻ���0�����F�v�����f��Ӯ{�҄�&��i�Y��u?C�i�f�m[����Cu���%����o�(���;�������`�_x�-ћ�E`����Q    ye��~'��_X!�کپ��g':�5	6C��aJ���Z�c�v�e�B�x���֜�1e�H��`9(�E�͚S1��|a�F
����9��6�	�R)E�9F�F�h�%m��/�^!�8�+ّ�qs���ok�HI�G���Fp��=���_���n՘8�u[o���]H�"��>*D	��}کپ<�|g:���^�w�N���çdw�~��KQ��x��z/:U�	�M����o�q$`����J~C���|y���G?��	�kԓ�iLu\�D~�&��<h��%�T�r����Ko��`�R�~���^�{a JѤXCQJ�wOsJ�	�������O[Pa�<�Wi��u���J��v3��)��h��i�YX��і8���^ga�R4��5��/�|�p�R϶`�Ho��"�ߠШ�;�������Wl�c���Q���vn��Xw��]��-�E�yG���)үqk��������wn���V�&��[���`�(3A��b��>D`E��}ӽ�yDA���7:��'��E{Hǯ�-���i�h��tY5��.�M�b��4�FS�c�0�Bji��Yo=�xn�!�QN���K��>2�gɜ�1=�\$@r/L}�u���AW���x�!ʡ)E�=�|��}3S�C����#sQR�`d���7��җ�;�`�ŏ���L��?�+e�z��{@*u��QN��j�rR�trns�d�w��/0]4ҿ!���o0��t	0	Fȵ	�	��o��_:߫��Ԏ�g����V(�R��������ԡ��l�>C/��Tq�[�zy����b�?�����}��͗����L\a��zy��!*F�ϐ���Cc�+�
��a#�}:���%����D�_���,57�>j<���^?�k!.;S��k�q]%U=�l��\�����Y�i�8������2������0���gA]��}@�gA��2�4�{Ĥl&��}ς������΂��֗�6��?7�`��7��9!^�!��Np��J,��	��*�aS��{޹X��C�߉�h���+ܧ;���Wme��ε�>�Hd����/�;�a��W�v�Η�zB�m��y��4-$��n)r,D0��������'# ��$}3\�9�Խ]�ág���=Y��*�?Ut#X�`X�yl�0������k6��P�}`D	��
�|��o�*�O�LyZ�_80Q�K�$+�0r�T����5�9d���m����j5�;E�a����!���)}#�l`����\�kO����|�谵#��U�?A��QuM�ȁ��a�f�u���<Fw�������w>0��1#O��(��@[��9d8$�s�S_醘���;\�9.��P�*�G���-��
	:δ���;�`��(�����v`jF�#
"U���<l�V���m��k�,�`�
�	HJV��ʸ�
���mI�VO�~������
��|���L�#�l�`�7/V��QC��aJn���>5xm?��j̕T�|Ԑ_80�RDw&�|Ԑ_����l�?G4��/����	5�V��d�j�s�0�ɛ����0Ţ� ����oCyEAA���EI\���֓�����i��f��K��sXC�iʔ��S���/E�P��fԜ���mjX+�F�w�&)h����P�t`t�S�ӂ��
����]}�sm�a[J?�����o+�՚�;d��;��vTr	\
V߱�L��j���:�v�m�a�R�dt�P��̱v�*�>\��=��Tcf+�_��7
��pPs�C�`x���B�yھ݀�fZoL5��}/���i��a��|���Km������Ê^]����0e��_�l��"�K|�����U�X5�\q�#�;�Oh��ݬz,|�;�)���i���)�5c�'������׶�b�g�#	��R�w���~D4y�1p2�3D�0Im�,`��;�0��$x�8����jC�^�R�U��;�7���d��tg�x�s�m^9�E���E�vx�84��9���<�k$Fť�ސw>0L���и��|{�Ķ�t��9��QXWHN0"��9�GM(g/����YU;�k��09Ū��
����b�Z��W��<0�����f;�%ڪ&D_o�l���,�<9)�s���{@p<�%�H;��;g\�'����iŻY*D���&3x&���tXz�6�l��n�����6iM*�3vȵ	�O��A
)Ǿ��>�Og3�TS�o�sA�K�z��Ow������tҠ$~�P�w`�Ȼ˗�)ԩ:̛��佧`�����I�y6Z�l��P�n�3�����m�ȓ23�;������~6i��r)X���vc�`��=�кK�*�?�;�`PR��^4������\�v=󥡋�?���J�/3�;�`�<�n`�f���Sz:+�|�'lbWϛ�4s����a�b��k�0թ&'{�9�C�YM<	X`�����2My�Mw`�K�n�'�O�\E�7�D��o0��+](�u��)��|*$�����f��B&J�>-E��}�'J�e�H{��<��y��a	��/-��7ű���(�Ok�.���/0����B�w��
3�nvy��o�jrw-L�����a�m�Fb�;��Q>0sc%A�
�� �;-%>��\��0����ҽ0�Ƴ�\YJD�
���<�i̓��&y�ǭ�kxm����Xr��/���兔YD���i���{`M^�g<g�w>0��%�ȸQ�>!��A0(�1[�#=0��%.c{z��
�޹�R�	^��,'�|4�_��B����c&j��o��9�]�����B��`Vq�E#̼����*�1��oz��{��S�-�C5����3D~�Q�x>�y�7)��=fy2Q����;)4�g�=n��gE~$�l�Su���f��9�g{Fw�j�e�N�;ǧys�n��o<�d�8K3/��&�O��$�f<?���s��n��]x`*��ST��Y�w�-��c[���j�l��1=?G��8��ǖ��<-fy~0eR�Ӳ$�|�J����u�.0LPe(����(���o�����lI�}+L7G��q�-r��ڱ��CX�a'ז��^߹�?�{ײ�M�����6/�
����e�	*��dn���c�?4#c�1տ`���K|�J��`M^[�'>g��sX���n��'�s}��)�W�69y��4����1�Ο8$�ѨJ*6�
q��+���x)����J���Q���H�OU<k�c��ÜKz���+f<�U�f�3��
Ja?������u�+*G��6�Ok6�;���WX���������Q�	��;F��V���0"��Џ��~����O맛�(�+��lGX%6hF��t��;Ls:�?��/&�Nvt��y�߷՛�>�� �����E>N�ؖ8�s_ga�3U�:�:�ԟ�e�+]gX�Ј����9�`����JWa�;ˌl(�V
}m�����v�;D*�����{a�V��`,�
{��Z��Sj�O�B�=Y��%׈�/�w�����bSg��w�oSʣR*LН����鸧(������/P\V���<�z����/0��q-�_j��l���e#�3��Ŷ\�f[0�G�@Qy!O���|�tŮ�7�G����/u��,JX��������;_`����+���+��Xm&M����)�cp�}g��e`{^,00�k�f�j��_ȧ��U���~�sc{/�U��*0yFIm�]-U�C�OK��b��6 ��M!Ds��	�l��x�v��^���F���L|�(��1��0.#{���;��PUg�jW���5�Ī1D鏦ƊUsR&sd�IYQ��+tɑ�^�6.� ��M�e��_�1��U���y���Fte3-��v��Zx��j+�o�?`���mzm@�
���w��Y�m�T�&�iO�,|�;L]rv+�KC�灑?��5����V]Ӷ��4����>-O���.�Ղ�ÔnSÚ��W݅�D�b���vV,ڛ�{�JT���r���{��m��XmL"#�z���?�P����K{���5    D0���`�����'��P�xE����)/��\=�HsN�=��4�H�+_�J:kD��29W���m�.�AJ�_��j����Vi]�]E����z/vҜ�;��f{XG�I��B����������^S/�=q��9�)���#�>&�yV��W���<?����T�A�<�����a���8����[87��y�߳P�빃5h͘�)��S4�{�[Q���<�<3�0k�A�Ջ�ؚ�^ ��1���D��^x`UzF
_	��eT�Z�d�-!`A��a��2�<�]+f�XV0��C�s�u�o(����Z����-f4��YY��={�/PvL�~����� )"����|�m\�[*_!X���9'�hH Z+Z��aaiz�o�΂�� ٔ�e@B����rR�E�Ƣ�9|)go�'nN�~ێ6R9�JUG�M�߹EX��(a�i�6hX�*��}�:m\?�����կ���1�_Nz����b��1�WH����}`�w�V��D�oV�9�o��+jf���D��;��ȏt��`�"�Ґ��(ҽ�S�.�@\��bFo�N1�WU��I�X��+�wl;��`�v��So�wl�w��y�.#w�Ѽzx��-~lx��5~��rnD0��f�"�e4*&�h���k�l���m��9zm?�ȅ*����?�%�A鯒*�`��7lQ���w����0�R��~0�2v�)B�s\�L
k:����e�XH�C$���]j���^$�͙<w���U�ݺ��vBbq��:�]���NhB��ؔT��L���Z��lS�Xį/X<��i�T �̙�o�Gt;r*�4�r&_�h��:�:��R��j�Lw=����z�̻or���k&�s��F��b�L ���/ݎ$��	���R�m���aN���ZxG��C�L������èXK
�k�qc/��׮�(��K-���e���c�K[,���x��y⥸�7ؤ�`HuU�@m*��ˊ���7��7Z���#��[,z`H2���؂�L���^wc#��y���M
�×�w�4�,�~�{��2��	�
��D�v�TG:���v����0<�9fS*s�d��
�M[���� �4O-��C�:W���F�������7�a���t�.�Ⱥ�J�;��#_o9�d����.��̫�K/n�ê������N���1�۸�d�i�;�#z\g�`l�^���Ӯ�������o��J���vveF�΂����5����:+�0]R�`��, �0��U3���>��kW1۞�/آ�I���V����#�*������g,���j/U�Li�r`^����E��R�#}+��?ҎR����l�2��{�{��Ǣg��+X��2���m���n��R4�6���D|?�;	L7�qc?`f[�B��vڮa������i��0�u'-�+�[�#�c�n�p��mŢ��f��3g�%��E�U�d���Gr���,/��0�t��~_R�?������FV�"`_R������e:��EŧU����̉�o'�G�D�*�l^J�t�0�$���$��oK.��qcW�,]Fj�T��};��6O��R��)��q!�3R;ҜX,�p���kf;�Ǝa�H��+�[J�F꧄�L)��ҖR���4`���a"��58e[6j�^���$UH)^�)X����\S]Kj��o�>�3z��F�l�ӕ��|Q#,��-09��,��l�$�j��R�TX��F��(X�m^��T�*uK��o��#��9%&FJ՘-�jZ����1�͛õ��`�����bFO��~�HY�M�,o��>�B9�G�O�����xB�d��`1�0j~�*�XmcȾ`�R%��(��� �Ͷg˟�b����>�� ��@kJW�Q�}�S�)�BJl����|-�KKl�V�>�*��Vb��Hv�!�¶�����zI�ϖ��\���tO��{�%O����51��i�O���d�����z|���R3�`���:�̶tՆo0B:om�
��:4�.��T�x	DZ!��_����@æ-s)��Gk)+,�I�h�x�,�~�3���,���"	LZ �=0z�KЀ��,����܊�Yh��遉(�i�
�Y��K1|��E+�������?f�$��S^_��@@��}iBEF(̌Esg#�yڠ�G4����VhF�h~l{o�
����V�Ъ�E�R�w��~��@��LgH�[K����<_o.8s�c�b?�1�`��I_J
8�2d�l@�
R���O�`^y%�_���`(�J����S�"m.�����\D\����?��`�jiܼ6��K�H��t�����\�@ܞ���N{���d�f7������:m������D���O��?������l�zA�.��?XS���`�H�y5]SNCs��|yZu��kK��p�;��hƒ��]��Hn������ym]�6c���$��5�Ҍer?�,UeX�k�+���l�s����⁉�}A$�Ҍ� ��vI�K�N���ғh�B�?`��?��_���}h_��'��z��.�3�^R�7���;��b��{��������Lŭ���a�{���,����G���w�$^�t������3��RSݭ2���o04U	�z�����Ԏ#0w���$9L�UĂ��&u���f5�
�>azi7����Fq󃻿46�:l;դ:�t�#chv������� p��.Xl�s^[C����/Z�f@	v��aiSM"����QvNI��Ce%�DI���`���?\��V�W�� ޟ����A�|i,��$m��fY6^z���-��*3��Y��%�zy�s X��x`jN�;Ɂ��4G@%a��S=��0xh���D^��V(��`�6`n�CXu�	����S��"�V��^�1�MEA�l�-��0Xa��:�2����IB�y�y��8r����#"PVM�.�AԐP�IB2(��o�(���7��a[/�n��J�g�#(&ݱ�{�����b����|�0�qà�|i��ug(v�2�`�����9m��\�����hd��V�ab�x�d�X��O���2r��~ۈu\Ê��V`���S�U9	�m�7.v+M�6�u\���n��ZA�i/��Q�#��WE�d0�B	0�����->|��Xq�J0!_�A^l7`�3:i�_�A��Vf ��������*!2ؼ�LOK?y�:�~�+l�ū�4 3ֺ?0�g�-�2_�t~���vHƠ��p+TK#�2����?�n��
����#g\�d�c�^�&Aح��iIM��N���n���K;�z�0dd�ҹ�d���Ҳ����h>�]�u"�ح?�6%B��t�-3�V<�8��iq�qA��wX%07	�TT�X�;���3�ofa���� ��<|B���` ����r�����y#gĉ����%b���11
�S5{v��K2h�����TC���4"�^`���;�ʧs#��/5��ƒ� �#��L/�<*�R_:�aSU:%��"�8qr[�6��}��)5N�XV�R����#�'L]Ks��`1�
L�c6 S��x��A����A[��KɁ��wWe����0�٬�� ���Ϧ�B���X�xd�������Q�m�q/��e��r$$��YK0�#��׶�x��>`�Ӳ,ΐB2�f6R&㩭�#6T��Y �.��A��"�xH%H�8
ɠ�,!�.�{�,�H��BT��p�A�����]oGnEɑ?�aTo&���.��ȭe����Aw���I�W��m�=�M�HQ����,��o��E2�S��-��J�6����
�Y\����f�`�����T�k�/���w��AE��[�0����i�[�a�>�Y��R#����VzU��PH��G�����o�U��є3*�kh1S C�]��H X�2qڲ�<-���!`$/Sfv���LI2��]l`���|����X$���\��2O>!v��#bN�B��v�'��`f����a��Un�۹��\1p�+y灎��j�ćO�I���    ���!�-��.�4;	��SF@%���h�:A���>J��HG{�lK]m<m�d��o��Ж�.���Gʲj��w��&��k<�:����cs���6������z�K{�z`����/�O�~�$�Ol�a����͖鷽 k�wH0n�`-�)�-���0�RU�k@F�t-�����*���)g��R_:n������s�-���S���[)I��`�f_�X�8��&Y4���8�]��
��ظ:�X��>(H������z�ɇ�>����rg��E�;��U�����\m�:�Y)���Ҍ�A�.����V/�YƛӇ���B�ü)L��O]`E�8�z�w~��J�PU~�w��)��I���q<���g殟�{�K��On��F�d��Z_z�uL�[��Y^H_�j�w<�r��.K"��E�G�AA��P��������Z��l������MR�Ea�Rf��0��ǿ0'`�D�27���`[�h-e)Qj�؉6O-���m7Mɠ��x ����|�̊V��َ���굚��e�c	��q7���`��3M*�m�[=��r����T���;Ƒ��<���>�w������Xe�}�l��E�ZM���oS%|U��+�0��,��;�X�>Բm�X�4�
���E��	�7�v6>`4H�t;�m��0+*Q5W��Ypf��H�"	v����Q�X���= �2*����Q���20+6��MT/�L6TAd�T�@����`��-0y��DrXU=R!%Ws�P���V��c���|�3���w�8a�ފ�T|����,�;_�M=P��&�<��O�0��ڜ��K��� PTE�N_����S�4��y/K�MYv��<���r�c���ۥ��e���(I-�Y�)DR��\g����ɨ�_�����Ƚ�F��i�'D��U�w�@U|�?�$긔P���0�O)�+X��4���7O���ڽbX�H��$)/S��0�+3u�������ix�	�`���cg�	�+��6����K]d//���o0Wu�vzh��w��D�9l�i�;�a�LW/�T��	x�j�J�+�󈓥�Rw}_��-�J=0�Sy(sW[d�x`�]i�"��"��<R�Ig�*��F�:��4w�#�]XQ�@G����aM���@Dp�&�<�j�b�����0y_6��m�B�y*$K�S̠��U�K�m ��Ĩ���:x����U�����[���/��H$�d{⥱���5t�W[��6`����U�SG̵�`j�_]�:b[�<���"� K�0q�u�7uD�X�_��ypZ���Qu����j��ab�K3��뉤���٨ȭ�S��ds<����L�����|/Kx��.�Y�@����
[�eV|��z<�����;G e�&�cu�h�S��\�׋��$x�UPN$oB|o�}�H��JN�5F������QW�')���兔�O��a�v�l~۾�
.#M���b���q�TYW/���*u\��2X���*%�>aE��I����U��B�	�@��w�rV����$�_A���P
[-g6��%|��bgQ7�v"7A��B�����ꖫu���Ӟ>an�7�^xh�#�;O�e�Lw�V���Z�o�E�t"*���}@���1���Thd�0�cd{�f؀��#�?�b\})*Uw���D~��8{/�3�B�(�a�b������E�tQ��F��T��og`�+�JK1��N3��ߧ`5L�z�W��*5-EaQ���?3	�����:M�pofu�,F0���}m/,�T׉�hx��\i)�e���<b@"��&ƏI]M�wn-�I�H۹�;�`T�ϡ�M��3kPd:<�X��:S�	��w�6��Y�K��[�6��e
D-�ƫuz<a�/+�w^GySp��`1．n�o�����{`Z�+�z��6�k�q��t��k0X�Y���5���U��e#�<�+ę+��il�o��B����D=�l��$yx������v*|B�����W'����IvϾ%xm����l�/��h��g|iGv�.6q�,�a�_M���o���g�_�	�s��ۗ>��j)	둀ub���p�������vm%���w��$v���n�H԰�Ɓo��ф�>߼Bi�M,roB���&�2��������GI�-�4�\JO{�6�i�I075oB�ú�7�xZ���)���`ik�v��6O�9�O$`Ey���֢��:g�\J�^'��Vt���EK���Q#�_����ngw��6���n�Ӊ�V�BiP����inR�5��l2"��(���O�����5��z�Qj[���l����Π�����fʅ��0��:+��k4�(j5�m�fN�ȣ* ٜ��}pգˣ�n��s�O�`��VT���o��ޮ�]����.�����ڸ�H��Jѯ�,G���Z�U�L��ƫ`^�+�]ٖ�&�;L�f90��0��9�h#��#����Ij4���:�U�To�[~�#�jV��79����Ш�����f��6�$�e�������vx�Q�`�k{`�Yf�K���0V�I`!ͫ�ڏ�y�Ϳ46^�0�v�~��m�w��p��� ]���,x�ך�,��!9�/��	�+L�!����4K�n���;�a���;
�?a��@���C��$P�Y+�rt�	=q���2���=Y�X�6��^|�lB�i�����3�H��*�h�;_`U�Q2�����>���'o;V/B:��j��$�\_OC���{�}ziB\T��r���Rb���:�{V���X���w��S3j*�u1�J9��r�K�,l\lJT®���H6����q��c~����B����ц����	���s�4�,�RxZ>�>D[��R�Ŭ�X�����f�\���/�C|d�~J�k	Fd�D�g+Va��bm�~��mnlgxw��C��>q�N3�'�(�Z�~��+��i�~0�e�]���T��V����#��d+�C+�^�k����y�,��O���ԋ�8������>��e�X	��R[��$1R�j���c�*#P��#���Q�a��L�����V[͂Ȭ���ڧ�Z�c��U��/.��R��/P�,Ү>0�����P����	�k�J�X㢬�����v�y|g3xZ�d����pI�Bk����i�q��ŦT��X��ueRr�@<n�{�-K�t*�R�R۹�f�iT�tO���&���������(����0�
Ku����K5n����w�� ��_�Pc=0���â���Q$��L�}T�����-[b���w.}W���\z��ho�ʩ���תT ��-	[7�T�B�O��0:����{���F��Ǩ�[���fȌ��Ӗم���YF�����c��+~�2��g{�&�)-��
�f���⩇&�C`ur��յI��b�������:�-�y��
�� 	;�4�����3W:�a�+�Ș�ɡ��o�CzO�B��l\��\M�sO�H%�U��J��ԏt��]9��z��>�d70����
��gOG���y�a��A*Q�r�������Ϣ��Ү�����I��^�7�K�׫��F��y(;��*O)*��LQ˳�q������C�k�l�*)���[��X;�m���-ɮ~���8DMY��
�R}����қ����,�E��l�R2Y#�����0��;?¼m(�;?�0��4W�t<�B���	�ʸB�Y���u2B�]��>R�v� ^�r�V�s����y��l�K��nŲ޼�V[¸�O]H:}&�"�4:#5r�z���Ԡ��?r���+̿^�^��ʝ�`��*�u5�C��~a�@qoyLu���}�yrR��Sa�S�ﰊ��\zh�x��{a�l��3�#}�|�&u��R�|�����w55Wt���𡒩Pu�d�)��>���7�xr*������J�,#&ݲ�$A�ab�xX,�D��&e?u�6Օ   ����_�Q��I��q�2���^`�=2�[Z�?&���я;_`DzH�֮_K1���jQ��b��~�����0�-�tX��.�x��~_`�B4�,�R���aE�����,H�Ɓ��K�i$X��mz������v�׹u
�u�GXH������$�G�)j��y���!��EOv�Y�`XH]&�z�DE>)a�3P f@�;?��d��z���0\��7��?�	��.r1n����r�ؐ�''�)w���-m�R)n�w��+�_/`Jd�0�<3���n��P�'��b�R?��T\����9`pR<FB/�9�|���g��[4�P�Z�Yơp�0`�\���(�o���D����.�f�Ͳq̆��^�D�Tw~��H��S��;�B���ڔ;?�(��!����n��br,�6`��Ά��-����ρ[R��-��^��C�)�O����� �Y�0$������w$)�mu�i��Zޑ>0ߢ��Zh��P�*��=4	A�ЄQZ��ҝ�$}�N�TY���Tl:�l{��KU�\l5yz2|zӼl/�t�ߢ\a-��/��R���H��d&��y�qjzR#	X=�ӯ�����ä5!{���Y[�ԝN�+�tZa7"k!h��o��4�le}t~��O��{�� 3���t�`��K}|����'Q��ka��Vt�֥o�}[V��s����&�GD⸐4K�H0ԧe��t��a����(~3�1�S���Z>�/�㧊�f�t���)��6���^2��^��t��d,�����j�0������>$����h��f��Y�X|�u��m����F��������5�ěr��WG���ѯ�W��C���;��a]%,����
����p���YL}\>��61���0�<|�'U�q[��-��BóE�l7X��O�V[ﰉG|ӎ�s���D\1
��s0��ϰJ辷�YҜVq����L{��0���D���t�HuP�,z�o0ε*��&,0K_o�f�(haئ��g!l�t���0������-P�M%`�k�]0U<�Wø��6T�Y��O-���0�2�I�U^��6��[�~���ٮ��r�Y��i��ݗmp�v$��[�I����e/���X^�0��,�̚��޸|՟xe2Ya��n}$ٽ��8^a��T%M?���N?15��a +鿩����{��2`���YYksža��WX�Z؃K=4�����<�B�q�7ݼ��:V$�X�$����-|3Ta��Y8��	�g��K�m%����7�<,|���9�F��r��`�
A=�%ʝ�{����D�~�ǭ�8kzh���G*h�2�gZa�Y4�������Jma�P�|���P���z�H)��}�B�3 H��y��v�A���c����[��}�ϥ�o�=��ˈnY1ҝ��|�?�.Iq���*���>�$��_��2�b�g��R���2`�n�������A�?�
�	6��>z��=���I��K��v5W@���ǖ�jtVߑ�� ���?XEJ�������HyVS���SG���[>�?q1������e��ظ[.��x�a��Z4 �,-��� �g۳�Y�0��С}���rС�:����A`%H4h�}�I�t0�ȳ0?;v�iy�v�.V&��c�Y������7b�G�V/c�󴨹����X�����������i'/j9h!���"�i-x���S��&��1ӎD�"�
7�=�tƼ����h���������?��v�      �      x�u][��(��n�"'�^��3�;�q��Ou!rU~U��)$A�����H�o��V�S�ڏ�W�,�?z���o�V�>���S�O�os��?~�؏�;F�V�v�H�)��ҵ�����wQ��R�O��W��ϼC���׊UmO-w����:���o|�2�<U��sZ�o\��iX��X�2�z111�G��e��s.6&f�T{g����^�L��1�g����X���j]��nf����.���w;���i���������M-�����h��u�#���/��ꏏ�M���3��p�����\0�~j{�Ok�-���.��v�8��f�L�cڏ��/|θb�h���>�o�o/}6��1�c�ma�������Gi���ؤXS�N��jb��ri�}�������|>&�F���#?Z����A?,>'�G�� ���W����R
1��Ӯ^�	V��oTE�c���+�΢�C�;�ц\�	L�s`@�x�jS�>7;WR��T�����Ε<pB��nv��2Z󱛝�Q�=�}�?v�s`����$D���#(�绩�7�f������gy�fg`�{����7;�Խ6������&U��Y�-�g�#�����B��"Nb���������u�30�=����x�fg�O��񛝕�S+��ɽ�f��8�k��������p\�񴛝����s2~����(u���v��r/��+�fg%b� ��lO����S��>�ng�w�Sq'�ng�}�2��w������MGӧ�����h{���\��}�UA�t�s,V�$����ad����<A�ӓ��:��1�';F"y4l�	=��O��vf��/�#|�������;�q�p^1xr��l��3J���B~��ϨW����b�s�q���<�r/����;�9@G�Fv=��A%� ;���v�p���g�e>�bgb���Ȅd�;⻦	�s��0���6��3ovfF.��Ky����B�٪!o�7;��ː?k}������"��g�����A��Dϼ�301��17;+�]+����fg`��(x�c1��x#0Ja;��\k��T^�g�;#�.7C3�@\�����d��L���Q��J�1"��Rq��|R� ���s���%��@|q���Z���'=���F��%�G�|D*9��kI<=W%r��@���r�5%)�A}iLܡ|�S��4\ l��"��Y����&�@I.P�Y��?���f(�]�ز<�@������Y.��~C��?w�8U��
���P�p�hIf��ޔ���I%��Ky%A)6~ <	ɅS�J
�b�Waq��*):���I�.'(����:�I.>�-E�=���	C^@K��Nϔ��KdjdA��OJ�2�P�WX�p& %�/PhW�@S~]"� a# ��Y�� %V	\��5���*�Xe�@߂Ѕ|ˢ�U&��98l��w���R�Z/�����I=�� %�@��!F���\ �-�s��@-�L���4UAhg��:CSdn	��+��x��*O�TQn)�X 0��t�8���Yh �R�va�"3(�� �砿{�;;-.�^�'�P6Gi,L�_ r����);-���Q�Q�N�oPe.D��F����?�p�[�s�q�7��<
�������SD��DR�RC�@-,�U�;�T�ʐ�T�c5(�96&@v���,�0�#/ -|tdgݑB��d�!K+�II���k����� ��u4�kҒ��y>���uRD�����ܠ����y��M�v0v@'�/46�a�J�T�tpV�N'��Tp�qV��*IRԢԋtv4��eY:�Ngm�;���#1�H�?����P�L�ZĻ~�������,����'�Z֟�$�/>.���oZ��%eIP(oV|}�
 ],��Z�s�HF��\ �������g�u�:�'u�;�UV���A��췝�2���AqJ�g�u�fh,&�,��� ��ʠ8�J�I��y@� ���_���+H1 :k�T#�b�pK������3�6�t�jo��� �IP��b&��l�-.���Lw���l/��1Ww�c���F�w�K(���,�"�b�N�_��*�/�����}7�b�(�h������A�O�ʼY<^�3��Q %V�����u�y�L< ���6��x\6�����>@���� �4�p)�ǅ��&���P�� I0li�9I�s��D���T��,�D��9@�UȣI$>�LI�s�ڪ,c�.'��I�������Y[�/M����O(d"d_Eؐ�, g1	^P:�d5Y|���s���N5Y\�ֶj�2�� %�/��g�`�Vj�x�ꪎ�OX��,��@�sLP��HWf_��KҜD.LF�Ȑ�,�@{�cK�n7���*���7i��n�	���`��9�b�0#��B;%͹@��
�n�̤9�`_e�>	Js��}gj�q&�{�0�`��_�4���߄�I�x�l�8k�4'A-�y���?5��� cv>�Ԝ��β�n�"Is.��h��@t*��z��	Щ�6�Eɤ)p��Z �xBB�β!A��P�I�� J
ȃǅIV���S�o�*O g�;i�Z�r|[��n����D,Zݧ�\ e�~;Ԇ���ܠ�
M�b_gg%k�X5a�` �KҜ��6
�S����g��$�5����nJ����pb�-:�_ԣ�ǋØ�gI�����!�935-N�)��u�U�;�eA�na�-�m�A��/ (�J��%��� _��R�r�	�!�#�y�x�n��R�5'E{�x�4RH�qT����Y�L���I川�D���� %_�]r�Γ��iP�0f�x�R��`�ØYs��X|ވvʚs��[F(Y<@�I*EV�%k��g�*�j��e� �;H�cf͹@3�^)� J> �ֽC��N��	{1��X��#��F&A���fy�ڡ���G���?W�:��{��W˯�	,����|��ymBIO��E�Y�9{��?y|um��|�q�DX�N)_ �t-~.)���P��),Ys.��Z&.)���/�m�>��e���O���h�Ys���#r"!f͹�R}�kx�n$�F�2f-f����J�)BY��F��r����9_<��5:�D>�(5����5ʂL��||��yԢ;{�2�� l���x7�| N���g����#�#FMn��"�E��5+�t��7(ې�T��5gtn�͝�.>)��Ic�j�6i�j�d!�`�~��v�@�h`� �e�JV�,v(Ι��T��}�P�&E�T�Z fl�aP�iI�� ypA���;iI>>��*�6H<�.>N�0}��ZR�v� Y�E�B����>l!�p�0\�X���J�lsYs.P_�89$@�/�D✙˚s�6���sЯ$VY56�)�
���Uf4h#(�G��j�x�,ZN��ZX��x|��@ �h>)��E+ő6��/���d��w��hqA�}:g� �"026��/Ю�h;�� (���Ak��E�K���i F�5�U��L�2��""�`Z���$V	�t�t�'��p�B�3�EPTI��M��p����5�vr����pn�̵��(A);�9��z��LI��itn&�#(��d9^c�N�Țs2/���v�7׬9(zs*gY4�j�dTB)"�茜4V�
��	���Z�.|�?}��I��UX�W=}|�h*�������Z��%n8�S�r���Ժ��A��]7xAҜ����\�����[���nI�s�j]S���3�����ObY���Q��š5i�r��S�t*���q�;(|�Nߠ�"���>��j9�Y�*�Ϲ@���uH����\���Ͱ�nq_��5Φ~��:6/�����ũK�3!�����Pc�	;��7��ǿ�"� 
H*ǿ��/P�Lj�J�L��9��%0}g4���u��b����g�� �@A6��5i�걥J3�S    ҜTc���[�����k,Ft�*�*��h�4�/�!��O��d�4'r��c�s�p�X�i�z������sB�S�v�5څ��cs���Y�� �;6�� ����C��`oC���	�1L�[9�'�/�:N��A.�g%k�"�D�� ����t�(0A�X�3�1��k�']|<���������	���Κ=_�nq�	t�%]Mc�d����蓦9�r_��O~]�%(�,^�G� �Y\b�&P
<�n���٘��%��.��H�*_�0��:�e�Bj��� �q��1j�.�B��U&��9uu�׾���<Wra�U�C�rD��w��ʞ�4xx^Xe����1�[�U�z#P�Z 'u^Xe��O�->a�yaJ��Ht��;�*�j���Rtf��댗�����l�bJ}�@P���eI}N�F$ƭ�� ����K��?B����ʿY%@����.Έ`�^@a-Z�@��䟫�J��r�y���s.Ќ� i�����? o�E� ��V�4���ʿU>@ѣ�G݀���~>Ih'z�����Cs.P�z����&|�dq�N\tĻҠ�&��29���@���U�����\@#�t*�����k܂0���1[��YHd2�u�l����^8�	P������dԎӗ� �\^aߜ/>� ����Cj�`�AQ�G�`�sf7��
IV^ 7��ul)��nq�C-s"P�\,�'�vȜ�$��8�T�(��l-�i���²}����V9hc�,����_�7���5?%E�r����J��NFt�8��@1�V�XO�;i�O�u�_����XE�zuzA����*�c�
:���,�`����
��g����2x�����d��>�_ABb(G qvX�s�pn����bq�Ne
�m�Y=�P����Y2��j�:PŲ�^A5���&«��A��Ơg��A�&pA���Y�����Bn��i��m�`U{L� ��wԿ0����,�J�ƶ(U$!����X������U�y�����\�>�r�{�x����c�{��}SKGփ���-��섽1s�e��*�+c�c�7�9=�J��oA��!(Y<@��e߼O�t���m'��}�J��w��!'���ء9Aq���@�U�7�3��8X�%V�@l�5l^�xK��@a��#�,��x�n�R�N��=����yL��,��z��+t��d���b�q��d���jc����-ZsL�K����k<�
�ȵ�7�����-���,>����i��Y|~îs%4�b�]��xg������HC�:�k��\�5O�q���ߡ9A-"'��4. �A�\��Cs4�2�OFQ��;4�}s=ؕ<pj���qj��C���HQ>�S��WxT=Y<@5F,:4>��d���xcg�:4���RHyz�F�� Y�}�q��d���}\�F���8�[Y�f�s���%�ݼY|F��#�W0ؼY|��R^N� $wO���r;NrH��,�?a�cY���(&�y��*�bqY�ڎ\���L>>�L;�@�y��|w!�w^,�
B��)�ԼX\֝�TP�3�\,.�ʼ�f���� �,+x�X|W��R�	���:�F�:H�^�_G|��{������	���<�C�^��F`������l3�g���ũ���Z�׻�=N�q^p�5�����n�ڹv��*�iL���ЅU���Ƿi��^/�����*N�@)r~�^N� LP�D�Q�l����9W[5N�qX��uI��Y�b9��yfb�u�u4�4ĳ�A��P�!�N��g̏[d�P� V�d��F���d���iw�u�I���3�<f۹,r�x-�DQ��Q�@���7(�������>N��2An,��N��/�D�j��A����?G�m/���	jq�Ty�����*���ĝ$=Y��&g���'�\OVY �
��	����*��N�l�No[�Q�t~ݩ���8�]^���
�u`W-�N�ӧPn5Lp���n�R�}���1F���tX<i�L��چN�s��5��!&y�KҜ��I<�����©J��.ߠ#b�����Wň�@��*����������w��/h|��T�mHl�͸����A,Ub}!��OV٠8�c"� t��/Ȣ�$v:fkDܘB��8��~V�6(ؗ�����.Y	��	��v�A��\�
xҜ�;�~:P�m�"��s��4g�ߔ	O4��xҜ� e�L�4�}cP��w-��o�_'l�zK>�@�%A�謫,�V���?x;�*Ԣ��0@g�\ �6}o�����aNO�����eig�$�E4g/����YW�QՎ�+/����3r�82��ޙ�_���Z��}�X`���'�IPe�@䬓)+@g䬫�J㰫'͹@������	���H����U*ӵ�97(Ncg�g J< �..��%���Q��<��%�qR� ��FH�s�$�+I#(E� �T�y+��XG�����"�L!�>g���Zܭ�d��|$��g�L���$H�M��j���ţ��@]eP�zҜ�%`�sГ�\�ur9�F�4��*cs2���u��NtT^S�3E� �,��]j3��E��'�2���5��u���&��x\���n1>��g>^����t�{!���*��Wk�X��x|����N��.���<���{�o���oo�ᵕ���	.p\�ӎ���q�ǘj� �R���������z-iΪ��/q�����G�^���L��C+)rj��%nl*��[9;�+��}��!(����gx�\9;S&��3����(\|]�s.��<��W�����\ �{a! � J7��u���ƟK�ݼ�1n��-i���$Ȱ#䷤9�E��B��)��}�n���y	J>n;�*��^P�j�q�
�<���S %�]��k�n�I��Z��*%����cy�[$�������W"���q���9'(�}=9�3�Z֜�q�Ұrcf�i�ܵdX5nά9?��AF�뒏ێ�e���U-k��,����%[�s.ӵ���e��*�y�G�{!��qx����5��~�+�t��~ �B""컬9A��H|���l�"�&��>g�}���q�>��������;�Z֜�opc-06�Β������F��jH�dq���� 
�4K�F*�zzf��f�:#���?͒�}'�omjvv$�R/�x�@�ǿ���N�C#4�X|�m<�Q-�M� ����¡e��q�P�7�ҡ���#�G�����*N�.їj-�A�'VY���Sr�QO> � ��j��=�J�x�6�*|��������\`O>���uZ�;O����>L �5�[��\�u�5O ��UD��mn*�i9��(RI��0���tK�$:�6�~n3eO������|7��E/�s��m���T�9�2{Exj��[D-/�4>�����nR��^R��G�?(�����=�t=�� $H�@ѽ$.X��>u$���k| ����� %.豥Z��x$��ٵ������d�ի�X��B$��;c'׮�U�j��,>㾞�s2���2�sw�[�Ax�R��'����,��x!�����S�=Y��t=�t��^֩ނpP��(��Cγ^���D�:��9��9���Ib���uA��Aqvr���SN��0�rb��}y'�ja�Dv���{��D�ĸ�`m�������u;���̢E������7�V>Ye��ݯ����N�oP\�9�,��4�&+�!�~�)ݞf״�3��U���}'��	����㼵�/�o��=�.#El)Nпu@m_���"l�紜���ކ����k=�;Qi�;�3��ߋ�㈏#/���Z�e��$�,�;�d�;�u�ڈ�؜,z�#��E�G�9�G�Q߁X�$M��;U٭^g� :-��q�-2C�������㎎�������B��F\�'�7�tK_Wz� �   a!@��b���#}���dwP�̛��v�y��lc����Me��wt��h]̉AٔJ���s{�q&U���/(j��*vZ|��aF���~�H� �W�I~�������&�4_�J.8�K��]��(�~�p����M�👁��ٵ_P�O�c�����y��4���      �      x�u\I�%9r\W��.�����	Zh)�t�s���^vrHP���x���n>Q����������������?��ѿ��E�?J�C��"?6~��^Z�����O�7F��?���������퉿� ����֭�>���?����M��gD�=�~E�o1�qCX�1�����B������{xy��+$�m�n��?HJD�� Į���H�^�#�\Er-�ը�X�&���|���a�����ߪ�~�]��G��8b{��|��~C��פT�G�a?���y�G��������"���V-������ݵ���Pf8�*`8��C�� ��J�(�ћL��ѩ�R���p)
^q���d��F�L����&Sן"o��U��o��gz{�&Sǹ������dꎛ��6���S����m�G 6�V�)@:^��D|#�����&�FD��i�!QV��	+�S�89��Qy_R��<�1��!ѡ�^.�o�moc<.7D��ت�����;�&�^��q����JlX�L6��h+�}Z(1�כBE���J���Q ������^�=�3��80XH!8�o%�V����rC`��R���W�� @��5�J���*Kykk{غ��witTPC��0��[�NG4���'�
����k��^���E�2�톀�AU�bwV����Pq���d�Z�� `ᘫ�T8Ͳ�H���x�Z��n���h8?(��L�] 8��H�:���oOרE
�V�!�O�o��j<5���Ym��w8Bt�=�]��{Í����
0�K�v�v%zޫN��p��Wm� _4ͫ`�O�)@B`�y6�7(I�]��#��%�PW ����;	@��:R�;ms�b�o���[TaZ��ۀ��k�Z�n�Ri&`��է�+�����^ �]�#5Z���]��˪щ�(pz��].����]�?]WC1x+<��aA���@P�����g�"YB�ր5�� 4}��ޥ?�^V�m@ ����
�"Oߍ���Sz�l8DvJUH��\�����Ѧ�#��
r=��<�S��� p�`#
�7�@t�H�/�~AP��W��~Ǫ񉠁��r����c��5��!�S[	��9��3Nm%���-�7��}���V^A6a)�lNk|n0�D,=�@��I'��1��2,�<����L�2�Z�h���+T'�X�@�1~�7�t��R/xQ��V��v�}ƫ���/�@{��(ʩ�� ��ƕf-G�51-��� <Y��oJ.->�T�J��vvBZR�� �d�������z���o�l�~k��%N����8����B�t/5���7!��y
�G�"���@�^+���������t�.!T
&�r������"7Ƞ��P^@��5.ی���q�j�gp��0��y�ԉ��3vs���A��A?�#��!%�Y�2���bidy!��A�?� �;:�HPv>q��k�7IFŕ1�����?��n��>'UˇK��_���	�Q�a�v�/�Q�-��� �Oy&r@~q��C}ۀ	�׌Q��[Y؄��%������qE��p�Į�������C�0�`?ZqJ>�~�e_.��R0ޑ���d����4O	��b�&�<h�0D�%�bRgGP���pԝ���!�{��g�@x�P�+o� .�03ޯ&�QU������B������2Bz2{�� �2�		f�^	X4,�Y� ��"V5�z���K�C�3Y~@*��T.�s-�����+�+�m��W4aG�:�7�v�P�� ��f�f53|�1�����Әm�`�S��[�����/�S�L�Ѻ�	0�h���z���
H��� �6����9>��]�3�����OQڎ����*�A�L�'5Ɲ��m;�,@���^��C�V7�ඡ3u��qO�����2uY��031�"|v�q�M�	���G�䂂Xm�%n�3��g�v#�D*tV��Sē`)�:�0��r`B���M�#)M�Jи��lklA��4ބA���0�/��0�)mˇ��=SH#���0�Y�eLo6"��̩"�M��;�H��H��7�껟�Ob~��������m��"�(E�yZb,�"661k���L�2��`N8����H[���Y�|�É�kFX�F�?5��d�$s
��P�Q���H��!7�d�>��w�BW# �D
;�f&����A�B��N\n\ �/��05��8t8�i�K�:����|A���e:LH�)E��BϒD���*���s}С"$�%ǥ�VS�x�����P��l;�'��������/ �R˩��i Č���
��LZ�V2Ӛ�2+1`$�Y�9@h=K���%oT�~9���Ce aٍDb�
��i��xOv���c� G����z+�(H,<36.����:\G%Ə�,�ۍ�H� ̮������7Ƞh�jw�P�@Xn��ި|�[�Ę�X��f�t�x-a'|����o�਺s_5Q� Do��)�ޭ�+v@���b���/�r�A�&+uL	�����*�Y�� ;��７���ŀi�gtVc�a1�-�����R|
X3Ε��	������L	1}A�[b��F���	�N&Ü;R��5۩�3qT�-��j;��q(��h,0;_�b@B��@������L�4�; �=��D�\�EQ��Y�d��[�=���-�0�VA/����,�Р��)�8��HH��knA=��P4RbIC�C�u��'D�TW����e-�J~%X_FH��' Z�A>�,�5 �%NY>�GSڒ#��К(���O���F�9�C�����S���44!�h���$�5/�Vm��dcoe�ҋ5�>!Q>��$56C�҄v�Ceȁ�DL��95}쨴��)��3`3��B��n_�4���~��KGǢ}�}�YĦ\��X}����ٿ�.��`��R���fi/3���q���Y�c��T��=��~�{,c8�s�t�ё�Yf@&��ZU�f �[�Ęg"6�g�m��d,��R��R��^������wԝ����tN���t=�a6$��4�f�t'ę�~��Lmh;%��XCdNȦ�	��)F_H�_�2!�CPmq�J���'��$z��d�U���\�pgiL[?�R�����L[���г�bbn|���e��A�80c?�[��8 ��F�O�fhe �I�u�@,�����)ݚmO�v@�a#ԅǈP�x��a��K�� �y �ʦ�7�z�܇�Њ��t�iK܀Z��q�.�� �O�ȍ�tI!��L� �M���Y��Z�M�>�\�b�G�&�HSdܤ˼}e*l�mkܤ�uv���M�d�.��M�$��7}�nd`4M+7�@����5�.��I�Z�� �t�Q�J@N�NN� G��a�)�O�A�g�n�[�C�>G�v���[q���!]B$C���+[�2k�%�<��$ݞ��DLjƚ��c{EN�=�ʘ��w��ǉ���G���dg�3)H��✎����4����g���W���� �7�=tJ�����]�p6�O����=�p�(��d�r$�yZ@6�0��NVı��"�A'
	�_3��hy���o��`����O7	[���p��\M���	a
���ҕ��$��� G0W��Ʉ�Wa_.,��;EX>���)�����R�d������} Y0��/���j!L>� ��;�����#�Y~e�)��6�z�h<l��+Le}P�9����-�� ]qqqH�/M>�a�Or1k�6!^��>`9!�5~��(��F�FgL���mĄ���{/ȇ�~�f_�GjL����$z&&�7���M·�3�c�ܴ��z�xdKy�B��Kl~���������{�0l�d/��'fd��$$nkk�����+����+&��}��
�x}Ag��E��[�b�r�D�4�D�A=0��<�ݿ<�8�Uc� �.Xs�r��a� �  �)�Y,N93΢O���&��%۳q8�Ƚ�rfY�q�!�/[�r�����&���=/<!��c��.0����5!�p%[G�)n�R��!3g]�p��܄4�5����\ b�(�G-�r��!0�`|yR�wS���,�F��tbBhnE�����n����L:���I�_�t��:n�+^lG����I0��[¸/$��/S�간q� �/pt�uBkv�4Z�bc�Z�錥k�&�K��C�[���t���7�ri�M�� ��b�ѩ��i�`ԡ�o�x���,��맍��mԗt9�9�;Sv����XߴW�eӦTpܶ�[��h��[j��ohV�-Qk���j������\H��d�8Ȋ��z&$��VF5�w	'ffN�91��5/�0�q�����	�~l�.=Ұl&���� ������K���Î��7s�VH��� Y|�#:�R��¢;�+/�R�K�[�f�6��m=���9�F��٘�eA8'5X�'�cS�jo���
{��m�dYɍl��#��"�j��ϫ�Kr x�$s��g�DǮ��aC����	�����O���.�a;b(��^vgC�l�æ���%&&5gm���u�>���B �ҁ٩���5����H9n,�@:�M���#8��.�A2�Dh���A�k�H)�hH͘�Ʀi�W��\�C��k����Q1�e%uK����Z,3��ٹ�M�s$��
v�8]��;�&b�2��ML�4s��U�91#m�ws>_�/F� `p�@WL�0�8x����WCg���B����C�8Z���~a,'��׳G�Q2�C��F7*ᙼ�H����y�r���U�Ձm�rd�5/C���K9>e@&��ǻ�R��:����m��,�D�I�]���mhtpV��ll-kKX�G���z�p2Øu/`Hn�dS7�w��r���\LX�/So� �������,co�A���5�w_��&�-5T	k��R��6�q-HE8���Jv%2۩���(�@�J�ts��;*]�{J7^ͺ;�8 ��Ϝ�3��q�e�mB�u��� ٸD���rx�ڀ�B��,�hN˧��ח	8@~���5'=6.�?a3�*;����HP��,ay�I:����d���æc�@x�G071cs�	��{����a���f�澘����=��d+ Lu��F׾u��9�H�hn��)��>����Z��}sX�]sl�enB<3)T,�� �[�+�����2���.��yᖉ�_���� ��H6��=�a�}�+B�r(X@��ʯ�V�[���N��O[�nBN���&$N����}�}t^�vJ�y�% 4N׶S�����
�N��e8hS��S�i鳕�#:��h�ψ�I�v�=����s�7r�v*��A7��8g�S��9y�0���o�����K0�L(b��uVu@��.�|��蝐��Okh�#pf�����g@5��5�}3嗜Q.љm��8�!h`�	��{�|%�E�����q@<�|��0%���9}629ǩ}h��ě����Z�����d�b�A~?��AkC�*<�X�����d�G��v|�#l?��0�2M��;�h F�A�����!]66���BV�&%��m�RNE?QV'9���������e�)ɱ&\&��R�^w��@R&y�A���33	���~f�2'f�ڍ�%n�lG�X��>XA���?�Qbz�##�v�	����rrؿ0㊙iX|w2�\1�hF����0�e8)��ᐕEH����/�'� ��4ɜ��.ö���!�@�C6#,�R�\�D>0[�!��%�a��u\�آ�	���z�~��1�Q0�v~f\1=Ӎ|���M��K`�e�-"��]�����̹�����g��ɰ)�v�x
rF*�� apLH����'��2)�T����7�����"�����J�Ӿ��{|I �g�Er�Ά�hV.�ψ_�=�#��o�� ⵕ��~t�M˸�`�av�x6ajg���K�,Y@��`[x�.^��_�ؿ�w����=�Î^��F�������m�6p����V����s�S��Yw@4��9_+�	�8�X%��Xj�9��F�g��Hi: ��J�0e2�֘�-��c1�`|�.����W�������B*0𹱇r�0��p-��r�n�-_]ɼ����띳o�Fy���)l� ���s'b�W�"�̮QD��ƦBo��-`4�qH�3M�^�`F-�X����he��D\ &s"�z�����=Qy+�-_�᱒J^�1/�����6���1.��$��7��(7!>�#AG�T�DĄ��k��v����!���K`��v[�Hv�Ar:����ˍ;��Q,��la܄H����Vw�n��۫p8*j�@����'����Cd�����wn$��!êFgb����6��cZg,�?����0�+��m.!P��D��&��̧p��������\�+���ㇲ�����g���r��;�b��>���h���2sWś���."A0�� Yiq��].����p��Q�����w��g�n��k6/C	�ۖ���)Ή��m��i>�W�!̈^�3`t��<�m�g�y�q:��k�G(}M s���'�����AL�h�!����<�Dd*�/!����E��w��E������������g{ 秵`��\9uχ��C�T�ǦZ��s0��%@N�dу-�ధږ?�����iÌ ������)���S�!⺳� ���#���4�WJ>L�H�^m��-/�L������J��>3 ���_�ig�?ȹ����%�[%�i����;��I�g�q)0��,(%�{͜'�xN�}�2�R?������%�Z�o|ȶf`��a��j|�����B2;��'n��s/�1@֖B,{���Gw��e�|hd��0�eԂ�mwb��yJ�R���I���RJϵ��;�v��:}�Sc���7���2Grk��_��-9h�#�(V�U�<���^@Ț#���D�׳�z�dg��H4�"�i߾�`�Vf����1��M،\�� �SU�k�(��`u�U2_+ ���_x��Eζ�MZx���7O� r�d�d  z�D���8�A�|HǙ�K��/H֭�LIc[��Q��+��6�9WW��|�M9�	H�C��9�͸At>�d�K��?@*�.�n+7���)|D�ɺ�<iM���?�V�~ ��������c�
�L�n�t9>'iȜ��{Ԗ��}�Ѳ�����G]�V~Ar���_]�V��ٽ��dm}_��
��c!͸�q��7'@{��+��D��U�]._�����e�����(�̧ԅU�a�G��J�#�%��2��|�<�����&]��3�\�a��.?�b��N��Kb�$�2�'u*8�m��L9{���$ƿ���z��I�My'$�>f)З�	���9�.,U�& ����7/ٶi �<�%1�B��h��Z^��I�m�iUG�|ų=�����ݭ�OO/�� ������oD�~;�;._�lW���=mI��o�N�t�N@~wk=)��̷ohz���vB2I��O@���ICp�_ 9��'���<�⟀���
�Q	�z�J�AZހ����}�ZJ�*��}���&���      �      x��=Y�㪮߹��ez�˛�8�=� ��|+��Ĳ��)?�0�aǿ��õ,�;��?vH~�fO��?�>��Hw��(���c�1q^6������yI}��]cO��2�r��>�d�O�p�c��˨�Xv`�eJ�@1��x��A��=|�}�:�P��n�R�gqT��]�~���oЁ�4�m�����c/SyМm���%��5���Jg"n\ʣ(**X?~Z����jp��_����͂�m��#n��������:�'�i�Y�q
�ZY��n��&�+<�8b���i�!�#G��y������=*���y���:������1���M'k�����N��I�3�'��M�&��ܤnp��3���	�iο^q�:9ja��~�.$�}H��
���_QlM=����,�pԞ��}����R�
(�"c	�9݃S�)�<���ٛ�e&g��VMk�� �X�K1*l��yz��Q��#��X��}�C��Zot6�D�<�暯��2��=g!�1vO�?��;���0%��R�T�FBU�9a]��dl4��B��V��h8!�M!��3���2�<m�MJ��7��U87��
|�o�����vHzO �B��M6����KW����#�Up����M�A�&���~Uy	D�\J�
�>����Q���~��׻h#�J~l�k�#��k�ĕI�������� �o��V ��Dj�}�W���V(3��6-bِ�c��OY1S�+��P�0��l��֑R=L~��i��8|/��k�f�o��}�)���-	�#p��Þ\��K��[�
���s
�Ϥ���C���_r.?�sRK=����=@�?d ��$�[hU�^6j��x\px�&x@�ퟱZ���4��(����*T�µzܢ�Ͽ���UV�>� :_�{�_����6b�z��-nqR�*���!9p��-��c�G��T�����} )�5���+3W���M79 g?)s��b�����Aф�]|r�-����&�V���x���>�ra,U����ƥ��Id�kƳ7ht��
��X̠�[��@&�4ƛ�"��fd���ʣ�P�w�	��eP�M��1�d8s�̊+w<D��Cb�2g�v"g_��¢��x�;��]�Ҏsq%F~gK-�=�z����+L+�7��
�D�_����J��߿�����T�v��ƎQ��u��4�81��Gߊ8#�GX�s���Y��O��ﲼw\ݯz�Gʌ���$CP�8�Y����@�G20ߥb���e�n�h��7{��[���X��t��&T۫ӧY���PZ��G�N�FN�8���O�?`@��N#�ׯ�N;�M2ܓ3��&/4gq��K�D����R��)��~�q��{v5��7���yW�����p���85u醋�S1�����8D�^�����#O�H��~�Un�@���Օ* *���|ř����8�@CH��P�(�u�����Y0�Y:���i�U,5�N��i�Ĺ�Vã`צO�Ųrl�`��h�)��8�P2�+5��c��qҥ�]JcL�,*Ty��s������U��"eت�NZڜ�����������olh�J�ı��Ҽ�	9�Tn�4Vk��P5��	DC>DǮ����X%�� ��G�p��0��ן�˓�n^����}A���pu�Ðz�����pM/�ҋ��x.ʾ�:������r�lq��E�k�E�g﮴��Gl���T�*�˴H�ܐ\/��u���(�L��\BB���hX�FR��0D8.~�)� Z�c_FZ�cչp��Jer����#�Q�\���M��Vf�g-��40uڌy��ZW>tN 黇���f���>� ���q��ƶ\���dD�i�ti�y��C�?@dc���8����\ �_�y�"�ҥ|ab��C�]���2���&���Y��DA
� �������& �ެ"B���V�C�K_�p�[`x����-�>:d|]Rs�l��J���eyk��6D�:�5Y�V8~���~��{+q�����y�����5�������ax���n�[(��tO݀���D�Bw�0�bF�'���)�]*��n����b�Cu�++��M&I*t����ypq`ף�Xx֨���q�kz1���l����7���9A's��d�����'��m��!�b�em+���h�+�>kH:ў�rL�q}ǱŜ���g�� S�n��[ȫ�J�n�3�؞��Ze�����,vl�!n$"��XknP(�i���ML�b�I�9���ŗ{h�U�c����诓��E2*߱:��`"4��G�l�wH��I�M��7L���d �ʯ?��?�p�)ט?�������]ѭ,���������fn��r�1E�-�=���"�&�H�j.����.{�U-������Z}4�;&Z���}�/pSB7��E�Oc�V>mAS��U:�B|�/xH�� �t�:jBޥ�uz�9G�гQ� �y�4j��AUj�+ۗO�d���Gf����ٲ��)��?�G�i�Z����v?Ay��E�=-�i�NZ>zM�����54PC8��\�y˸1�u�U>���{����vQ��a�a�H4��'h�ٻf�/NI���i��;9���gO��)/��F\-����}hR�K�PMێ��������2SP;�P���y�#�+��Ĥ�ř@����"�;_���Y?r0�H[��l����''��$0���4T�޾ZJ�M�\�^g��w�(F�| /��w�Ͽ�xY[H��x�|�GDl�{�F��$eȗoI]���=� *��KN<.X�:@�[��ߐEP����Z�p�v(&�ی�h˫C|��!�{8N���ԇ芏E(���UP��_���6@�]6V�Ϯ&Fa��6�9,��
���4]f|���f��.W�F����\��M�G>"L� j͜[iy:��\�X�ߣ���)�Ѧ�^�B���^7�X�b������ Ƽ��k�d�kf����}O']�l�u��,$t@2X,��YVM���
�4rW�ۙ��������.8$�dg� ؏�@�Z�u��V|O䄼E?�P� �1m��k��.n>ngvu��NE0�w��Y����0��\p�{��;ʙ����3��H��<��v �G�f�pb�nؐ���j&?�Ax)`'MH_��ǘ�W`W� ��j�D��Б9�'I�O�3�Dܟt§�b�K� q�s 7�3L��g/%��
��?H��hp��M
(R�>��4�/ ��Y y@`��%��\���(����ќ����2-��~���&���ݜD��j�%����RN����3����k��6�j�l&�� ��Z���| ae{ҳL�=y��l�_#���&|#����s��--8W��H���\�`�"ن�N�;Jx��\���0��9���V�֩k��d���r���5<�D@*6�La����'��ޡS�����n��ix~�Rw�Ø���)7Sy=q�����ޛ�_�>A�z�0��j]� �#VS�s�WX��5�i�tN|�K��{�����!^(8vXp|,s���x:�����Eۄ���L����̧�̏n����Ԫ��WAv�K���1q���G�#o���g�AzW���V�S*ϐҾs��4-do�u����|*���T��]֒$k��$��4��:t^�kl�%QS"_�<�,�'J�aRI�ç숣&������W	������,��1�B�*����a�M �������,	����]8\�eW>�le��FPO'��H��GO��i��ס'Ƹ��W�1:)�d,�5��wU���Ǐ�z�~7Y$~dd�d?�#�ˇ�Av�-�]��I���+�'�$K�h}p�jO���ρ�;6.�I��	�O��y�Q���(��E� c3�8Ԭ�tjD�qbq'��,�80�S�����8$�!�{>r��j�'�bF?)������;��%/ŊOh|���oD��Ά��"�G�R�f�D�����مLG(�����d�o�W�[2lJG�Y7�i��77���;A2    w8h���<���8�~+�sI�31�g��}��c�^��+��p|=�cÒ����5U]Й�W��rOB%�q���V�S�퓱Ō-@<�ʅ�D�s`Ԡ�fm��T"�$����=RtOE2�̀�¡����,V�W���u�m�z��$q�)-�ɔ�J�2����>.8F�����ζj��5���I8��Ս�K�Ϊ�F���g���=l����ĝV�uѤ�B�r��PV޺O4>G����a�tu���R����2_�s�hb/#Wg�7�¯|$S��p5>�<�Ԗl�9{`��p��8�?����[��[�������h�����r�^�H���X��M$�D	�������Jt�&'�`@��
ݹ�Q�\���GG�٘�<�J@F�1�~x��w�����Q��*֜.�e��mO��棾��� �P!��j=bT��y����m��"�Z�����1�Α9��F����;�L�h�?�%����DI*�r���Ju���H���%���1�^Vl�9�c�Q~"�)�*�����&��_�zGC,���Gvp��*PvEs�g*���򸂘��p$z��=};�1j��fM6�S�:ۿb˲#���\	 ����0������+FAG��f�9�x>6�r��MW���Z�Y~�vTg�\D�v�o'SJ��D�ȣ�l3"7�\y`� 1��`�	h��Uv��L-r5�c�K�j��=T];-�"�����W���UH��O,�t$��O�.l����Lė��JbsIK����(9�uW%]DV�Gm{LI9���H)]ߩʾY����ɵ�j��7�Dߦ���B�5���):�:hh!;b*�Sk�!G <!ڑ�l_�<�Ec@�j���C�
(t6R(���
Cϣ?}�%���0�Y^4�Yt��^�O7$���9H��r�q7ʷi!��%jĸ1K�@���gWV�:oj�ʬ����|Ńi��E���:>6�K�Vg[�?bfc#To�T�G:w��Uj��)ܰ�m�ͣ,��a��� (8xF5g����\'��=���#�'������f=�a?����;�4�{���q3���W���H����`"��u]G�!�lܨ�3�)�9?���
���T�:*۾�����K֓��=��S	�`���5V�Go�F����H���M>T�H��jbJߙI���=�\�5p�Bv5��5�\�J�=���{�=�������\p�=I¦�~ls����6~��SC�������|?`Ԕ�F�p�Q_(�Gp�r8�/��R����v��o��ɼ�T�]iF�i{��(l��N����+�W�,�8�߳���̙!��L�r?�Ú��~���T���_l�Z�sill�nV���#8�5�
�G��qç�6�ǯoh3�1�9	�C��Łh���� A�mX����h�wu���a�鉆bXlQ�dr��+�l�(Z��w��/$+
��H�%Y�С���U�F�������L��.�݄6�4�j�����,#�2�Yy�ŢT��;�I1}�?���},�0:S��hp	�4�K�j������b�)']����q�S���Bb?��j����I�Jͽ���u:n���I>z3�3Q�H�9�E�ʞq�4�KNm_e��(�])�,�(��j�,�b�.��I�ĬutG�I����{�>�v����e!�O��CA�"�턠����T�>�-��f��1�4�N$����nS$N,*�o�'��@1��q��+�����9[?��B �]�C�=1�b�Y��C�]l6� �"z"���Y�5��hl���'�<���t]�v�F�9�����%*t��3�Ha��"0e�`�z32K��q���c8l$���n��g6g�"��D5��B��e%%�Sp A�t<�$fP�����@��[��'�i����:���e�������iF��WP�@�R�{C3l�/r��>�3�d�	�&�!D&�7y Yy��H1�}!	��r�+Q��ϛ�z=* ����JG!�b�)��8�4F�/aZw�_�FS���oh.�Ҿ�d"���Fg���C�l��AU*�*.�ft�%M��=[ϫW���7���$7jj�#�B���a1�+�LG��y*u�-�O�3?L���8�X`�ut�V=ZD���H�İ�T�!1�ǭ!��$��4Y	4�\�9�T[��ʁ����E���29�I<$�3�����6p���>�@����..R%"Mح��n� F8���<�P�>~*A+ˋ�MJ�q��?�f���c�\�ͮ�M��� g��"��V�<�r��x�:DFy�����t����Ƈe���\�#p��:G"�k�!["]Uya)GFY�_~��u�f��e�ZM:H<��G�P���w\�H�26>���ir�PJdߜ�Yc�L)hleW�Xјz�-?j���BJ̉�bV�\��m8۩l�σ/������#7ʘ����s5�X�Х�T����D:�3�(�e�j��,?q�h�W���G���"%R��g�����.E��0o�?�3O���7ʓ�W���y~MQ�#楺@��O����>2�[%�	b�8���MxH'ST���C1�f���n��s�s�[�~&�(6j�rn���I��;��J�]�[�#8�Z�G-�9{�;ǎژ#�vY�yi R��S6sIz��r�}�i�,L���i��jm� wtrVH�J��꭪H�]}_�b�+�WW�����Q��
��z�$&/�C&�No�}���]$ ��.���w��ߜU(�#�t{!BE�#v��yq��2�4j_����c����o><�����qZ���O�ݱ���j��L�e�]�u��iR���L���j�ߴ��Y"QO�\�<����勨8�o�۶�}�Q
��1�狉3Ǥ@�AyPtf��{�h����˶�:�#�A;��J�]�au�N=��Ȅ��%�4v��m57���/i=����+5\c�m@t��G> b��]�9"�dv�FH��z�ꇌ��_���B�i*�q�5�z�K���Oh!��?u���U�q����3��$;���{���{�D^dN#o���:�Mjb��G2b�L�L�2�c�K�Ƀ�P��G���A�Հ�U�11?�38\��+ױ��|�3iX�H�2ݠ�*� ;	=�c�`�'v�_�X�ǥ�WL2ϯ�uS�h65U�lj>Ùܱdڄ�������q��1t�M�6`�X��4\G
?�p�:!��ǟ�䬊�7��RH�dj���|M��}���`��2U)hT� %.�nz=ؾ��&w������D�D͗�%��i���fO�I6��r�7�;ٖqk=.��g�U��2�Ȅ���T��=���-��5JC�B�� ?.��
����=J���׎���QE$ӾlR�����Q�o?��E�б�ζo��B�,A��rW���q�L��{D���`Jl ������2��}ba�de��2G�)�(�iyB3H������C׹F��ՠo5�������������@���'n�%@���RB�&ܸd�yp2\�<��~��:����>�(5�q���x����<u�¼����(	���6�[r2b�;Ҽ|��!)�<����F���r#�8X��=j�z�.s���&�����w2�$��?�*���cZI�<
��J2�%"�~�M1g_jHK�k$	Y|V�Bb�^D�-#��Ƨ�6��9]�rV(I.,>ޑ�*&t��y��n�Κc�����'H懱��*��q����s�Q����������W��#�gY�Wn�f�MBA������'HD~Y�U\v�6�"x��q��R}���A�ͫ�,h�n�*�庱$�:[dk��6�d.��s�c�����(�Q���/�d/:"j���B����uG:��5幍�5��*���>]��*Ɩz��i�lq>�E�\A5�/�`cM�LzhlBLeFb|C��l	�˶��{Gp�B\-��o��L�*��..j��S��	�7<���$�)�0/��br    	� p�6�~7������}� ��&�Lvn�!p�Ay�=�����ہ�'�Nr���p���F��ji�ھ���v��h��
$��NX��%Di���e6Uu(ia�=�V�[�s�	ӵP�����y�-fZ�/@��d���>�Ƙ��d�sT��y��~���=�(�A�p?g&���:��f�|���L�$̀Y~��|RȻӘV��v�y)݄;����o�۵����w�.�Xr��W�*�@"Z�7�$�[#FoopY��s��r�`��0͈���F�Z�)�t��O_#����'$�w�$
�e���<"�I����P�S�s�!�i��3"���1��A~_��p��M;���4]�&1�"��h�X� ;��.����8�=X4�:��3@i*�ެO��%���e݉�_�	�'I��٣�b��yJ�I�>e�6�r�S�,z����,g$7Q��kj���f�w��u�2��I%�45�bT����&�2�8����h�7�G�`�E6�`^��,Ug)IS _3/G�QtUr�c��:/�O�7^.�V0f"Q@1���^e���w���B��щڵ��4�����.�6���sh�v�'MԿ����X����g,�͜=4�΄4RPm^k�w;�,T� r�ә����R,G�^���M�15?.��.߂�s��\�c��h�hS��M]�X��l�@9����	C.w-b�ԛ��f��G H��úy-�"aW�g=��5�$~uU��AR����<+G1}QKEU��`%���8���z*+'e����a��K'��E]}N1���>U��WQ�1���XjU/#�Z��Ш�r�ižz7RO�.�?c7����Iᘝl�DR�AF�H��3��)���^U&��.�+�5*��j�o��f���pɕ%&��F�S�`����pSv	�چ�]@��Y�]��JY�K'��RE���ʥi]�<�=ھ��^��E̹o#�P�rugnu}XV��蓫x�ED�y���k�{�H�d^~�GJ�rN�b�R���x��RKE �X���y�b� (S
�X�V��i�u(3��c�b�����K{�Ty�ؠf̈�b^�?EUS|����<�̣+���m��-�i֙<�}�<��\���[��)C'� ���T�K����)7E�����;1��m�d��c.T���DQl�����i�crC�B��_  ��. N��yT�V#���[�VH�e{�Ny�dW ?��'L���z�;��N�a���[^L6��;��?���R��Tzg�b/h�Nd�=��Љ�e�zT�T������ٷ����T�0p��M���\�H^*�c��#z^H��f��YF-�=-��^�Tb�0.����ÇMx)�#�t݊y������F��"[��:���lQ�8E96ؤ$A��rn�W���0-QD��/��͓�KPv��-�h�!@�'���pY�w�b�rԾg#,�/�I]��N����cBltq�Us�<�VoQ�&��<#��8�������⍚�����Awҫ�+e���H�-�;:o��`i娈�Ė@ܫ�j���|�x�P�ت��%��e��)�~6��� ��p%hD�6�L:~��P�gn��)j�0.#,YV/�:i�����.2�<�h�L�	.��/��!>.# 6�ΪɌծV����h����|��xBg_[�wF�9�������y��;������PBDHGO�Æģ��@�< ��c-�����ّ�s�)��݄��#^z&�q�vA�b�}�b��� �m3A�MJ�;�'S@b��جF� T��k倉�S�����1	�E9g���pX�SԈ*��|y������u��V�>s���y�4@ڪ����Ē���@�ȑ�@w��A�#j�^��EMN�h�E=)��j1�����)�'�f:I{��5K���O9k��)[ʞ�{t*G���D�4
�H��͙̃������J�F�����|J\�v��)�	�C�6<����(��i�F'P.����ש]�+��������V{�W��R(�a`��|��a��n�>w��x�~�T�8���Ӹ������U�Ɉ��L}�	��h�e���剅`���N�:���N��u��<!�� +#��(���"�<s�}p���g-��l�z�̮�<}�Kr�o�NB�.��2ؓ	9���V�f %�2���?��"��J����$�F�Fx3�^�|#b�� ?�J�C�<k��"��&*>nE�_5��Η��}�@&QW�`'���q:l�T9���-n>`I�T�64!7�s[!FX����~y{�^��i*N��O������6R���bA�=P����԰��#7�sh�!$�����d�[t��.'mD�m���� :K��f�v�Wp��5�>r���@��oRV�O�OwZ�(�.+�5o��ol�-1����l��l�%��0�������R>2����h�}�؝��#6�b�c"8���e]\�f tLs*��EyQ��?�������߳D�N�|i�¶p ��t�:ܸ��::��><��GΣc��˲����*��F��YE6��|Y3��!X��s�L��(�Y#��È�Ua%���GS�k�g�^���S���o�I�zj$�㸠s�t ��5U���x��T*����� �9B���52嵻i�?xv+_�(%�H��_cR��W��Kly��3�S�nyf6X?�7&�э��������Py�Fg<�;�dv&@My=�q R	��z�8���[9�2SK��e�R�Xx"��%A�˾�fd����M#]�8�9���z6��9-Z��y�"6uZ�0�ZPW�8�k6�|XLI���t�\.��v[_��́J,���G�`"�9�0�b�5Y�0������ T%���u�)�I7P1d�Q�0��r�
ݬ�ƬO��r��O�m.�l�b��������4%O9���F���p�D��ّ����F۲P�)�����Q�.�V�[����S.�A�9mGjҸӃ>���KMR��\��a&���Q��-[�H��&?g<��<��������r�q��C����B��q�q��il2e�n$x�e���C�(�����a�d��.z�q�˕|-.�_H�;��$l�Cm>�oj<��>�y��Тկ��A���^؄&d������kd�T������� �O@*oe����z�F4�'E��St�A&2��$�e����aY�k;<�Wu����l~y���8���W�/�O�\���Vs%�94/�����>pe�l�u��"�����w��P��*�|U�zT� �P�"�qr��/H�l�V>��h��K����o�[��I�u�v=Sh�xht������<���ts��<.O��&OC���W��N4G��LH֘vv.Jt�m
|0�x��^��	ϐ`��
˼�5Lab��5��Ο7�w���d�Hg��(Iz��F����{�%Eb��>�wf�7��e�I��z||��ە����6_?�6���&��4k��|�HaS&���m}}������ۦ�oE�^�\���������"�������w����X�p&C@�J6)�1~�IDu��H��4�.�6��$	[E���>���M�+&��NS
VO��1��~���D��횅$B�ƭ3j�Z@d���yD]�f<:��$tt��B�Wر����Z߲e��\p�Sl���k]�He����@܅O1�{K�
x�"Rޞ�)ƆS�?�*�ӵ]y�fےZ��T~d����:k<���	��=b��i�X�ZƸ����:�?�����!����Ï�n��C��e[k���T}ŹRl�C[zQ�![�C������*�g6�9y��
i�PZ7Gȣ���xt�t�O?3>�����.�z`���;����O�:�` ��Lٔ�C� �M�I�3�[��8�P�`�y�q�u��e��O����c�����1~�d�',w�>�0mE��%Z�`�(��Zhc�"m�����u"��IcLyS{Z    ��c'�ʳ,��D8��l�	'�޵�&)�
�:p����Fǫr���QĠj�H��s��nZ�c�N+�j���ft�gO�sˮbތ��e�Wx�F���2�|���鍾��:�բqq�� W�(�����{��]��kw�r3�\�[����W���`P�*U��`m����%}�ߊ&���6h�=^����C�t��R},��zٮX8td�q��;��դ�C�W~�x��]�ljy7Qa~52�*E:�+�?${�KW�pu~�Gln���9��.��m��LfS)uxG(��x��jW����]�@�f ��ZAmC��z�Ա�C�F�hH���F�1RB�'I(���O��xI�vfp�#�!�gA�شXK��3;�<V�t;1z���S��6������O](��]	{qQ���H�*LL[zV��ʊ#�%�G�t�Q�����U��h>��:塀|a���$�=��X_��Ľt�诎p�H�x�o˛���sw��7���m�H�2'�w��w�^|F��&����$e�R#T6�.��Y��U�s7�H���*]�I���%㾖X�L����ëF��̼"c�yg<�n9�"����B��1��Y���XuĠ�����(�M.�cf\b��D�u:7��ހX=�IQ7�م��Eb��5 mY�x�����)�:��㾉w,��g_ܷ�%)Ȃ�qA��8Ģ}�"���A�w����'ڰ�Vǈ��\6�>�F6�������qJ����V�&r���~d�/;=��+��k[ /}��$Rg�0)Ҷ�7�Yډ":.jj׶�Z�`L4\�p�fs?*]YӨ�e:ƅ�����h���:m{��\f��czjN�*p�^���Q�S�Η29ȭ����%jj8~��x�5���=��|�#�_`"6�N{B��	�-fE�LG��W�h�չq920$W6��Z�S���[ ��#L��d�a�5_f١k�`ڠ��V��;�?�(b3
f�0"((Ӛ��x����~������L��x���9���ڐѲ7=
�d��,�n8�֝�2��t��H��}I�2ē������h��I�hUqYK�Mj�wЬj��#ú�������Ϧg�Ѕ�Ģێ8��J�7��w�X!ˡ!�2�Aɋ�Qm��u!��.�A3�M��;x�,u4�L��a���{`���tB��LЦ%�h�YwE:�M�H������G���I$�ޖ8xmW�O�i]-^ݱY�:w�b��%0���y��s��	^E�EqyF�+ג1���J�������F���Щ�\�i^����d�,$���6�2�m����;�N�^�3��?�F��<	uԥ�!�φ��T�ر<��.�t����]��s��聙a!DX����B$FbV�U%"�y��a�ߩ�Z7�{3Q�|9����s9I��y�u|�X+�yy��J�E^��']�ŉ�O��X�g�7�nH���P�՚���t)7'�X�r$Z�9/�������v�!X�ɌDPkѐ�� �4g���\�N�+O��C2�q���"V���sq6��D_(���&�u����������1��l��k�r5`?�����NF���-pܔ�� ��)nˣ.=E�]���]���Ya�R0Z�Z?�a�˥�|���ⶒ��O����8.]��7s�d��#&a\�yz�%��c7�%���׻���jF��,�k�r�ո� ����0XR�(������,�Wx���х�.�E�`�c��"R׎X��~G_d�2`7��}��06E}����;%[`�C��H�Ţ�X��l݉r� �$x�aa��0~d
��k}�3h�SUl\"Ơ��&�H��^`�(SQy~F���7E9�-VH��$�c/���+��5�X���	x�t4���9F����	�xH(�`�sv S�H~b��B�����*yJ7�	1�B����r)&\@��#J�	� u�O����e���8Z'
G>�aU�_�����j7����bg,4���z3l�R1l�N=�)�"�����?�2�M���;�hF���bb�]��{�`q.�wf۸G�l`d@Joǒ�+<a���7�>Ê�N�q�"�\N5)������*�˛�O��T�$2^�NT2����ȟ��ʹ�.C=l�e=cr�i�(�l����4?`���ba��j�����L)��3�������:��
��Qɘ�t��K���;���m\v,1��#����W�ݳ9xB���>��8ͤ���"M\^"����0W6S���X�v/U�<��QM.�ѱ�6���Hu�̢��4�J�OX��%�z�4��MG�$��3�.Q�`r��xF���l�pEy�FT,�<��
#�F�o��n�9d�"i�dGK�</��Q1���6��cS�8��d��:�jDq�%K�� ݠ�g�q�1���}| $D��?�bxiR"���р{�.X�<ј��@+m��9�0��p���e�ّǆ�<я�wAG�7}��]�9nӠ����a+�A��/��kg���A��ަԿ ���9`�45�����l�Xɽcv%��Y9�=������O�������"t�6/tFvϤ���&���߄���~��w\��eJy3l�BP̫d�BC���|ۦ	w�$ pbBG7	�¹�v��gU��qPthR2�(�M(�P�f�,S�U���
����4�B�t:�
e+:�Ž�Q�O��d�V��O�E��gG�����]璘�9⦾1�Ĥo��6�� -V��@�/��8��>�������{iL���V���Ǖށ]����V�>=Lk��Í�f|y�z@/R�N�c%��.!�$B#�s�;i����h�뷷Nm�\ZϗL����G_i�i�}֥26�E��3 4r�>J��j�;
ձ���Fr|��Q|ux1��}����=`��$�����r�ô�t,X�Tʬ��z�>z��Y����U��C�T�ЩsG4��#6�?)$�J�`��5�<Γ����� u�>�H�m������H19��s��=-#>��g+�6���4w�/�u7�-_� ;;�l[�K��)6j�;�~��`00���O���n(]<�8�ڴ��>iƃ�-H����e�ߏL,Ty�J;����Y���D.BV�Sm��I�ޫV*F��E�0j)�v�v�9i��t�xPL7�i�9ظ���$Y<�ܮO��TG��r���G*�|�<@�e��~�gM5mz���8�'C j�!�(���鴩g���so���<ZewV�W��{=l��w�\�˅��F��c���e����T����4�fXa$uY�Z��Z�	p@t����v��6����mC�`On6e ��߳�.�p����w�ǿ-6�6_�a�q���B8��!Y�T�LXy���p)Oh8�|6;�|����|�.��u$y>D�5�[
~�w����L}�K���;�!��G��X����Y�n9�o����,h�4�"��)d?�;2T�@���ʡ�X�|���ȴ�H�Ԉ�L�>�J:j���N}��v5�-�G9t5Ԝ28l�E���Ka�<��E�z~u��p�b���K7꽽���d���%�r���~zr��2u�Bٖ�pHJ�4FES;�gK���WKDirѮ8����p�G��SOs){�
��	$t�gA��~����;-�	L)i~�E6��@�>��ֲ�Xzw'�)n��M�5��b�-R��u�6N(fa8������t��j�X˰�Wx���4������U�P��mB������+�ql*��M(��D3����:$).��C�H�@�φ��ߌ*Z���Պ�QǸ���ӎ��߇C��=���d����<DG�A���?2�F͐əw�̆�ѣ�4�a��#�م �'�-���`!�@��F�O��Ci�}5�6W��Ɍ>��![�A���hd��4�y�H2�!}zLw��G]�r�&�Y����
��k)���L�n\�7Y�`�B0�Q��i����N��ߵ�d�r�B=䣦������%�E   ����gm�ё?]�yGsu�I<�)�m�=7��A@4����=��<t��a�3����D�S�'�1�XB[�v>��ן2�62���0�P8^H��8s ��)18R1��9�;�)��o6��i �\��I��j(�]hT���?�wn8�M;��e�Fci[`��9�'?̆��8վYT����Ҿ���C_>K�;OgpB'��!�
�^�/�}��a$*���"?��T$s��u�,�u�*�sV���8+ ?�z��gC����֑��}`xF��M獦�.8\�U��6�[Oy���h���b� ە����#���0�A�n����IYD_����=h6t�U��Y���1G����1/C~%�r\�*��>��U;s3����H  $6����Ĳѐ�Ff�	-6�B<��ez� /"âj�>0|[Pa���Y �Ɏ������ؼ�_}b��ء��%1b��8�$��^冕c�^�:��B�7��Vm��̕��T�m��G�$f��F���{��M����°�f:H������ƸM3atxt&�i�2ŪbhB0�ꂺ�I(�J�d̀	�```	ez��
�5������'$�,1Qi����
�Il�¦�#���C��Ԓ�B��y��x�h���c����;z�hy������0beJ��I�G���1�	��\�X��Xc �.8"�s_������٧|�cO�y���yj�F��s����Fo���uO��S�GwN������e�~q��pY�4�\(���SeL���J����Y�1PH�oP���>��,D�2��3�m�kSbD6kR���Cǜ�8rB�'{\l���6oy�qR���%gLgz�)uC��Yc�ħ%#$Ҧg�.�t\$';H*�!�p%Zf�h6+�h���2f���Q���e!r��xy�u�.C^�%��q��G�$�� ���yb�d��.tuRcaRe���2��&x�W��*�l��޿��K3TsL�
��� �h=���f�������?�4�      �   1  x���=��0�k�<����]�0+��~�] M�I�pr��[l�H�XK����!���l:�F���ԋ��?��ԽV�(��W�	��M���Y�V�J���Zt�~w�0�I�|:W��-7;7�l|[ʊ�ޥ�Zt}#*
��P��m�2�t��Nʘ,�i�����t���~L�Q�hg�k\��)���2��r[�\N
s9��k2�5�d%Z�r�ws�-f.'�L�S5�z�·���`d{�s{
��Rc6N,h`Ѣ��>���q�3�R̤�h��Uo[�3^�n��IA�C��}�����{v62��3�bU�EXȬ�B����	">�l�;wr���&=^���I�_��1
�(D��NA��䒾F��_��`��u1;�"�j�˪~`� ��.@v�Rٳ�4�F�jO?���L�P��^-���Z2�f���F���k����`-�/��С���2�%�j>�~-`k��Z@��R-�jjq�]-�Ҋ������?���6��$����F�p�N7OD������ �t�~z�l6� 3�W�      �   *   x�3�442�44 =����Ñ��5�Ӑ3@�+F��� �[�      �   `   x�3�4�4�34�n�������@� .#|��@�P�� B�I��$��
M�)DL6%f���VbAX�%T	\6E�  F�!Q���Q���� 6LH�      �   �  x����n�@����j��`L0	`��R)�+�h�+ŷ{詷�CO}�Xg��I�H�}�o�og8�Eir&/&�y^1	9�{��~���h�U� 5�`��\`�i6g��f����-@��uVN��ݼʊ��"��ER{����^dqT��\ee��LEQU�BHls��y����uW�ִ� e�7f��Kj��Z�B10'����	�ε0|��y�ų|�F�\�0M��fL	翪*�!&B�^��kaj��*��dD�*P:P
V�&�y�!U����H�2͏�ɳ�ĕP$�I��f���|�F�����Z�¬��m�E{�тt���G�6�|z���6z�����"T�h�:���7-�n�P6�����gݧ񳚗����N
�o�D+.X8� �g#��� 1.�Z�wT�����(�n�;�^f6~}h��,�8;~-A�hh8�QQ��7��LA�4�K�ĥ����ڈ�����!i�,�۝%/��k|2���p�����4<\�8Y�f!��{Y��^u;����{71:���r?�2`��/���~zo�Q�]����dvK��4U���xLS+ ��O�گ����n����	�P�欢]��Ͼ�o'�#1�0?�s/�      �   �  x�uS�n�@��<�����!$q�#��Q�hc.6p
�n���3�ź+Q�� Bs;�3�\p���?oqp=�5�#қ�\r!!��b�a�N׾���r�X�a���6�XquS�%���C��ڵ�����ph���X�ap#(Z�86�p}�o>0V�õ���N�j^^g��2%��iV����2�1�I��[�#̟p2�6=�@�c)��� "��?C$�G[�U&%'��2g	d-�k�����
���j\`��8t�dl��WB��_l����yHD$!M�BΙ$�</Oc�8���� ��|y�ʷd32ȖH�l"h���f<A�Lt+�G�����MdU�3�1d8���oG����� �b�( ����~�����DN�YY��U9�ʅ"�lYQr7�G�����
�����@&��g9��	��#n���ݯ���t"�$��Â�R�R���)���g�P�7�G�� ���J�"�^�H����`��4wi+���/gS��̤J�����;!�A��$�d���v��f煈����T$Ȃln%¾�J�4�;���Z��a�*$�(���Zr�s��z�>��[JG�hz�Q�3�Qʩ���mF���{���랾dH��R%�2X��b��I�\cg�qE"-��C��J#Q7��:X�c��^C=�	vv\H��(��=hK      �   �  x�mXK�$7[�S����3���~� �GHʪ~A2O�j�,Q%�U��}�߿?�9�9�m|�e>����j�__���+?��g{�`��}-�>������E�V?�Z9O�Z�^��&\[��L,8ß���Jo�jӫ��C�����y4t�g(��xƀ�MC;��p6w��ѵIO��d$��w��O��w�4�բcX o�
� {����yQ��������M��R,�dJ
Ý|e�2�k�?d�~��YJ���/C��8�~�lYL3b�%!��l7x�e0��HX:;`�E��Z6=�|>a>8����,�	��(�>��l���I�v��H'�qّ��<͏�^���8{ђ��G V�����7�B�w������
�5�4g0p�2y�:7�������$� �`D�b��-%ڷ�b )��N��	��A 5U�f����0:Y�禊9�����Y�A0
���έ>.���*Q��V9R�u3�U�NҜV6��\ތ��H�ZA�ۭ�N�5n�<o j�(@ Q��ߚ�^1����bJNP�U%@�����t1��,#�ҍ�R�m#�p�J\7�T����x&e&�8T�C怂��
���9�lg��������|x�#���
G���;K�9���J-���}N��9�|�>�]t�=�LI�����
�<��-)�ȠF��4d�Ղp@@�ѓ�s��׵��l�'%����쵋�JTD�b��)`b^�\��[����P��j*�c!���K��-�KFdAeEu0���V��t�{��Z=�'���	(��RjHS�[F[/���j\(U�j�^�
�@��G���j���%��MQ��:�X���KUX�ov�B���S/�~C?������z�Ԋ���^>q2�O�%/��#���U�s��@�Y����+�z��L�0"tR|���G/M ���^��*��mم�^(�*NKǲ����
�/"������$T=>��\�Oe�-��Z\э{��tL�Qj�)�B�G�X2@B&��>�Z��OU%2�d©)I��71BΜ����E`&{�I�R;�- q
xe��:�p���Dş�����V����4Oqu!�H�TsS��!&�?)��,��u��0|w��s��-͡�K����c�B��]���+���9O&ؤ�L1�+P��R�NoehdI�$o{Dחw���%P3��̬r�E���t��M���V�oӚ�tH̪���'R��!5����m�ӈ�[+TA0�(�|�1��L�/	6��鹿\I2e�<L��*��]5��`s�Pv18�GL4Dt��c�m���X.1��->b
�&�a�V����hv�//c<�&z�z�i��]��Y�B���E��{Ov�v'����#�`��
��B����Nj+�ELR�r��15D��7wJŀ2iX��P̠*���.z�3z�~W棾͠���M�;�B\"��L��<��|�j�g��@�HO9�߆A� Ȭ�j;�*ŮFU=�m�nw���3o�6y�d�����Yfj�j�sUnO�GJ����OW��dI�r����]�S`���W��埃C-��6�m�-����s!�d-u.<�2͋�f�ũ��<�aI73��*����;���ȾU";��I.����N�h�����{k���f�޾C�N�2>y� �$��b�-�q�R���D͝�yV����y��nA͞щ�y ��u!jO=��P�tym����q�J[E���t/5(�����8=Z�/bN#}�;5l5�v7�'��vp����r��/֩���o�Ps�?&'����~�895�?c���j�T\��%�R��8�I���Te�����Ł�S1�Nhp�ӹ�j��������D4��_�r����`��Z�J��R�ج��h��#��&�Ϟ9��,�A)�\Բ���k�FGX�ԯ���<�s�޳�?�R�?>Q	      �      x��Yo�ؖ.����S��H�Rp��W�dY�[��%Re��IQ��T����F��n��<f	T�ܧB����z��A[�d*"3�䩛���D������
�I���DZ�'�z��0�&Ô
�Ô�L������N�ퟚ''��b�}��r�E����Z��?�ě�³<�c�'1�v&Ig��yE��w�� rW�I��}�����e�2C�a�|m����$�����I�3?tg�^��p�����EV������"���1�R�cO��'�p�/S��+��6}����5tO�:3�ܑ點�Tg�m���3�:�� i�5,�Y���2L7���%t:���5�Y�)[��b�L8S׮�t�Vs���&&k?����x���fF���~��<i9k �Κ�.n^�YQ��'KJ������_~$��%��^W��%���DI��:�Y<���y&���k��s����2]s��1מ����b+C�2+�7����z���_C?����3&|c�L����\ A|�������#v'j���\���1gψ��5�6<j��`�6����5���{3�i����� f�7�o��0~���c��kh�v��+w+S��U#k�ܞ���e��]q��~8�h8��_�����9�I˶j��l�����o��#���`j�n:	����_7���S�����p	ظh�� �G��ⴟ�Nivs�HQ(�(�����=Ɔ�a����wv��M��z3|��# ���mOB�+�e�ۮ.̃?w_X�e�F��������}�s�����ezC=���)�Z��=7w�Z1�	s��C�L�8$�ؤ#lc��o�ɢ�A�o:��T��?Ҟ�A�aC_���������3������H�f-8֌�<M3�΢{���C��9n�!�+�0�dVN��p�)���c�ٜ�r�8�b�7ڹ��V���VܡV��kX����`�3wh���1#Ӷ֧p��M��r�D؝��C<`d�������B�A�;�r���4�����s8�����)�����p�/��c@��~����ͭ�Ac�&O�!��Ȼ�eb
���D_ #E&c��bb2���S�������+������h����^�'�1���]s0N�>�C3rᐟ�7=�y{�R{6�옪�)3���K�3?%{CȦ��R�U���>�):�:œL��,E; $�JM�p
<U�!�Ss�90�����F6���ԗ
���=m�*�im�F"Alk:�0y��s�xU}.�J�k!�UJ;�D�/�X�TX�\l�g�q�@3�߅i�Q�q��Sv9O���O#��Qj[�;������Ob�3�ԡRN��l�p�֜�����"V�=���C�x{�1ec@'x�#ha�.�i"s�g��]=7�㛬R�Pڀ��,=Ea���0�L�rm�Rн/pf����I��V��d�@���v8�}w7��eC�G�̽�l���%_�i�#}����mV��uM̉�@Ԭ�Փ�n���WG�gw\8��U.�%J|����'�F��X��#��L�pꨵ�A�t����G���� �É�8���W��<�NC���$��B�*���Z��p'>Q$l�\�9m:E.
�!QD$����axT�r@#�p��̙[���(��v���c>�si��ygf�����:������:l�LR��E�妑3�YZ�(lH��(�"��S���T��	7�2}	�GK��L~�����2��%J���L�;ed��B��YK3?v]�;H�#�6?�������R�ϯ.�WS^��m����F9���������L�F���o+�[C�Vʆ���5_��$lf{Jz���<�7rߧ�
���������^&OY�*$'M±��-ɑG��ͻ�5Uӝ�?��Ry���~'��`˧���P�HD������3�)��g�t�p)nw/	;���T�+����G��
~�@��/P��ADu搆���d2s��X?�&�RJ;���Q�(�Q���:�� �qp���o7�ۏ�6a��ETby�:�g�c��׫�a��j�^~�^�ziB%$4º��@\�ʣ��w�F�b̳)���bM��g�A�"U	)�#50��c}f�pH݊�ͤ��bޮ<NG�AJ��Zc��0��ow���%W�4��@:lc+��� �PS�?����_����+8���	���J�9�˔.�;��w17Ǆ0�Sß�5���a9����OP�֩�0�#}`����u�po�z�f)���ŕR�hOd_�/(�Jʆ�e�e���е~��L��7��.���,*"���`I�U+�7�Z�솶cT&E��R9qk��5����c�ێ�,,^��C��&�6h~ ��ahC���� ��@7v�M�`��z_�H�^�$"�7�_�p���~+�Y���&M=�L/���#�V��F����.���,m�sm��xr?P�1[�Yu������}S�\����rշ{��E�;/�Q}~X��%S�e^f7)\��~aX���5o,�v~ŋ9��w���\jdJz�6�D��<�5�rm^sċ�md��e5f��o��+�RHi9]��}���t�
7*<p��-� �C{)��d,�����h<�J)w����H�Q��غ���D�!�8�<���w�J;
�$��/19��ItǀX�^�i G����MDnT�BB6��<l�����mZ�ZŔ�Ju�z��vj.K�F6]�S��_d��2h(�]�"g ��iJb?ef�����K�~��U�	����v~��?��v��u����c�v �/���I�s�LD�%c��%K�F����<���@�ވz�3/st�k^�뼔�#(T�!El��Q�����B4+�S��A%!~�h��['S���:��Pw�P�n�烾w}�r�*�F!��E�PQ�1da�ԧ��ji��ܥq�Փ�.�_��ƶq΋.W����.�>+�F Y��J(�8��6#}y�0���Xz�O'��"�0��G�En�����ΰ�%�S�.ՇCӇU'7t�<K��X��!�F@� xٟL?'r�'�����0n��3���G"���8))�x��:F6�f�����0V���W	>=�sO�]�&p�T��
�ơg�De�qw'�=�ts[_a?��>_ן���M3h��Q�4�}nmͻ����vrN�	�
���,%l���)*|�T񚃙AN��_���-������sIn.�I�Jb�����{a,^UJ����*���'4t�q�zȲ�63�9�2k5�s>�γ<Ui��D8�}�ݓ�?w;�/[�h]���g�jd�W�ئ�dt�~:م���u����]V�~������8T���/�j5�0@$⯊j��7�p��;�XL�Aw	,�n���)�s�fA�8��=]�s��d�u����0���s��ۏ�Ǭ�$�+XW�ѳ�?���.x@��M+���ÿ����lpyu�8�1Ǐ�%?�\ݜ/%�}�ۭ���I���4!�0`
��l҄�iEZ�	�=eJ��t�,����ɏ�~�TJ��}��"M�/Y�K��j�X�P�{[M���v���(�m���鳺�:�ZU.�3�1>oͫ�l����n�� �غ��6���	�/H|ᘰ^�nN�1אʗ�u��R�v���=��\f �i�M7��+C��d)�c�>�H�"{	<a>�{�=�U���E���Zׁ�~=���V����D���a��_���ŵ�[Kw՛y�^e�<�J�����˾UUb�!.@%�����0+]�$td��h3�:a\�0��b�G2%�^�E�$3�|&g��E�W��g?hJ,
��Q�Wf�E0��DU&u*U����JI���"Af+��˥�ɝ����g��9A�e[�{�KQ;A�k�8��`z���R��K7+�ew��5�N��v��KH��G� �A��E}d�f���f-�k�P9�=ϵmc�w����GƏ^�j�c�(���6�w��BC�M�"R���e���uB���s��1�w����*�g	�j��&��u]/4�R���Zn�B��x���kV[��
��*K9���q    7�rNue(9��_}�P����ݑ0c�:��3A��&��7�f:t(G"�_�N±�T17���u�j�c�����S$^?��?�0�dVh��W|�႙��,��vP�u���J�,��֫t=��Q%�\=�{�v�cw����0ك9��g�bȵ��i�)ur7աvq.R�ԙ�>9�����S�:�O���T=���ő�V�Yav=l9��wd�b�2<��ۏ݊�w�����ʏ�����8�.��X��=֭�~@�!��5�u������ڹ��3�tyYo����&16\	_f��DN���W��*R��^ԭp��,jc���3s�\Mw.�9����1S6x|:oυ~� �"�/x!s���򆁽�1���̭T�J��eV�.�s�R��e\���:Zr)��Z7Ay�Z�;�3\�8�#�᮸gsl:�zS�nف_�[���B�aĎ��[9��,0�m��-���^�0L�W�����y@<�z�Y�NJa�	_���IG�~4_1C7��1��a����L/���h�G�1~��[1�8۷���K�%u#IǞ�(�eE�K��%w�H``�]��H��(�ݐ�6���C?"����uԹ�/��Uf��$�n(��bt������7��ݫ�^����1���;�K�G�X������Ca�\^_8����W���[�#���'N�,�D�������d;�k��z|��?e��l�Y��;P,;�2���j<�V�n�Њ��l~	�4�9��j���Ӷo��\��f�Bl����Gq%}ϔ��7Đ"aULwl��L�^���ܪO�,�3'p;�� g%������>#�2;m��ʷ��;D�w:�מ� ��q�[w)枧���2� �	�u)��-_����XX���1�A���_\خ�C��C���Br���7(����i2D���� #Hu��$"��L��[X�\-���-�<�g�3�I�%q&I_���z�:�0������G���e�HO��`��-=��&I�u`�ޣ]e+gvݼlz��ۭ�e�Xx%Q�6�&�s2)1�8=`�o�qbz�r�����sfV�_�rB�	/ǯ��Ķ<P�6����>��c��qC[�i�M��:�Z��3�W�۟F�sD��]��(��� [�H<H�!�>����"E({f�b烉��Y-����]"��X%kl-6��q���y��~u#i�G��]ISPF��nfF̾5�WnR���U/�{e���	�hp׶`��~:�C�ө�JW�,�*��/lΞ�%g��XtP�����]Z-��z�^�&M�!-�����E���܋�	@�s� ��>�Ίi�k��g�����h9�lI���!KN�R���C�7J����E���h"3	[�EU{-�U5{���*a�a�!�摐�퇪\VF���K&6]���_��/���C̯��� �i��X?r��8�g�Ϧ�����i��J`����K�sFmf��������L�q��♔�n[^�\��ٗ�уM��^P��������������]��~��w%���ѹ�u�Xܸ{��{�����]��	h �Go?���m�4�F�b�z7���/�l4��u�y:c2-��M�=��e\���a���T4u1�ג{s��@�5����W�]IӮ<y5
�����f��`�D���b���-g�2�_L�O�'��}�#t�	{h5g��G�EI5Ο���F.MV� $���7/옳x���x&�i�������-��F����d�gnmyg�GZ8����{�3e-u泗A{�y^i}�Wo�׎��{w��CƯlv��H�&g��>�8�2���?�&�y/?>>]?�Ai��Ⳝ6+�,��_Ь s�p�x�c�ٗ@Rp��2��,�r���	��s$Iǔ��Q�����8 Ju͜1y�W>�m�3i�N88x�~�������j��۶vQ�q�W�ƠN'��	�x�z��+E��C`�5���x~H���C�~Ѓ���\}�[�+\��ɔ3k�������2>�,WbYM��JY�n�w𪬰���U��#�J߹�[�ٛ�i�(���/ʯ	Fi�b��4����\�h^Y����qYe��q8�ݙ5�Q�V�Xƌ�{��]S�i����e3&~͌)���<�N�A2dP��^��չ[R�#GU�ޗA��!���-s���U��خa��TE��{��^��gc��8Rp{f�c7g<=�W�i��v�2zq$gq����]a�fI�IeZp;�Qc����o%�m�J�]�-��t�bVi��p�t���8�6�N箳p��}]��4������{;:�LX�6��j�->'w˙�ʹ�*�N��ɹ� �����aJ��8B���|�7��&��8C�e�/e�n�s�i�fE�ߙb���/(�(Eǅ�_�s�Ϝ��\w+���a�(R/t��m�����`N��~��;p��u������T>+���������'EVTN`5A�~�����n��3$s�,>�n_���ի4Yc�j���TK8ȸ�3b�%��'��,�|���Q�Ai���8��,�*�p�Swy?��&Q ��=3J? 2J������ ��C@޿�1�@����*cM[��@a3�ڸX/s �\��۸<�Z�X�N2{��%[y��ګ��$�̐��	Z^EV��n�����_g�/��ʖ��z��u2n�n�3�e~�
>��S!\7��_�'���j������]����.�n<�J�<>��W�~tĂIbKgo����[�*��n�T5S_��]"���������Les���{5��,
�-�y�ح�VK�Rc�ʝb�^h���ٹF���=Evs�Xn�X��
���'�I"� Iē*���Ub�/�@�jc[����Ǩ�Wu[�jWu��c�2�v�kg���XMV�/i���Xqw��2����-&�L��j0Ȝ;�������˳�]6�q�%��j^�V�����c/Q�ӥ;3� ��I�������t�h����-�Tdq	<�e:��?s7���ﶈ��L �lf� #�9� HɌ���X��1�p��32�9`��ˌ`�����0�
/lh��-ff�3�"��C��G�쳐�;K+�Ks��0ò+y؟>c�HU����z��Ǐ	$�H�7=F`��Z�v� r݃!c.��=W��Jf&Ff�����FI��d��	L#�H���?!G8d����q�h���	�lA��q�_\���`+�bP�q�I�[��Lى����en�qY�	04�p�*5�0�ō����}e.-X��`�@����gt�1���ᔀ8�� ��Y3�C�q='�T�2�b�Swkn�����"�V�g��3�g.�������/��=�2Ks#����A�r�v��Am�j�<�����3���I{d�����[�!��.��ZĤ1T\v��)�c�������]00������>�œ�1c�į�m	��g�N49Rp���~.���`���Z������E�' N�$kbn�2�E�YS�V`y�㮬)����Fg��+r�6�Ld����o]�+��lͺa�����'(�n��g"{�Ky�UeU�{��� �d���ј���s�E08h��'��;�Ћ��� j��DΏ�CW)��d���u�@^�-��j�����q����h�p2'i��f��r{yѻ�,�ͧf�[�f��n>�'�>�Hz��uF�$\h`g��V<���F�[nW�r��+�\��{��|a��ф��乮�������
$����O�̈��V�Z����XO �I�3�3����I�e����=�8��2@�	�4�:7&`ϐ�p�a-<�����n>7�a'�OCs��p�ǰB����z�zN舶ȹ�GO�[�+�=+�c�9�OG.:���Q:�c��kg$��g��P���	}Xx��S�X%/
����q�n�u���vn	7�N��0Ivi��$����0Ϙ�k�~X��r��9����&�{�\�t⁂;��ؠ"8j�C���0GN����Tƺ��>�atG    �|9����z���H��{�`WH/�Z��{t���Դ��JnZǽЗ�ݐL,co�}�R~(����}�Y�k�.�f�������v�	L~hH5�=�.C���%g�	{ɘ���p�3Q8�DP�%VU�}Gڊ�%�dܿ1�m"ҟA$*r+x�39@7R\C|����'����c�>��ᨑ��	��SӍEg8��������aJT�撺�M��E0�_;n�{�n�Y����.S��":��&�?n��]�o��`�Gl"L�����7���K-��Zb_+L�r!gS)�Q����wF� g�¢U�w��.�Os�3	7Q�W-0�Y@���4
�wPܹ��`��B�3��}�+���m�ݿV���U�jF���5)�$�t��},��X��":��i��;�ѐʇi�5�T�j+���	��CǼ���d>��>m�ȳҮ%T܎�F�0BI���I�.��v�Ă߀��u;��MB���d�[L苁Y��)��ID��Y)݌�����z�xV�������g>��J��"�۩�AG Z�=�X{$�}���;PX�@��nE$���[�Ĥ�1�X	z�z�3ĉI˻MH�݅'_9�m'�]ʹ��[�^�Xm5�
��r	N��uRJ9�н~x/�7�7�uz�K��FO
w�D��P�:�k��m�֩2��A	X/b?c��,����Q�c�b��/n�t���~҇�N���*a�Ҩtc8$kZ:�Ez�;u�a���WW��^�A�Ã/��&�m�PW���	�	���촆z�q���珅�t�IƋ|�^���N�l'�>�]�C������Ũӹ-���:��-�w���tr�U��4�� z�B��kiY��r1������UQ���P���|�5�F�t]Q/�u{g�����ھ�*��#��K����z�xV=iD+�S��Z_�>�b�Bf'ڳ5�·e��Kw�m:IW(N@N
���av�xm_j��]zO�4��~���ad9e��Ɛ���C�/�Ek��w�ޣ��Q�s�w�]��ǡ3�C�o��$���3����25�<H*��3)㖻k��ZD����$M�L���b�b�h��-i��`�Oܧ��̶J�u�T�[���I���^���ks��jN��'��N�`~8�;kv�Mg7bc:��{����k�� ���H�&�3�p-�bb�w��{/Ė�&й2�A@�c�Qk+|�б0ҮT���	7>j�$p��vFt%�Z��Z��7.;��Q�x��{�C���"����e�����O���Eʲ�HI�w�P)���Z�s�:�۷t�N��r���F���/�z�UU�պ��Rr��q4,�4DM<"��s����ª01�z�H(����)mv<\�uՕQ+��ꗯσ�ċ�1�Ő(J��]_?�}����|݀'��0��q���{gG�6�����c�J�U�]L���Ž0h[S��.� �|�䤆(Ǭ�!�!I
�|؊;�6[y�'O�$A�x!��]����҅�a�%}ݿk�z|��.5x��u!!ze��1�q6\��B�߀��rh!��Nl(K���o1ߧ�}Kt�%!��74X�t�}l"p3F��>3���K[�t��UlW
}"�1����L',Ĝ}�d�vo����=�^R�,qX}a�֟!P��������0��,��mLq��l&'�0���{�fz�����Lqk!Єe���KmL�u�ꩦ�nlz�b>s�`��
�e���b����OG�)O���9qAz	�ߘ1�. q��J�7/�;��'�v�:S��⠗�1�)Jզ��[Z;�b���x�C�E(>�n��w�ϴ^n��芄�v�Jr���7�|�\��+W�v���;��}wd���M�)[U�UTY��}�N�Fe���ɝ3��	�wۭ�lR�ٕ����{e��V8N��s�mz�z转{ݰmK/]���Z�c�N�t��ƒ/�VU��XIc��j�b�w֢ظ-���f��A�xj�u�[���� @'�2�2�{XR1�h�q��iR���N�ZgF!��n	v/X�V;� ��0-��Ǣ�ؒ9��5#Gy��Ĵ-�!���N-��`>���������X_r�"��ꗌ�zFK�=0ڒ�h�l�Ȁu�7O��g9C�舀�q��f������ʖ�RY7���z�M�S�C�B&�̒���%�r���폠K�����0lJ�c�2�i!��I����Hq�(
���Z���!I=J�S��ak{��&�lMv�b���7#�;$hlC��<�:��?yfh��ρ���P�uˀ?�������3FC����@���ȍT��s����$H&�0�t�t}������Y�B4g�S��n;Ndn�y���������}	[7�G�p5g�;JS���7Ӈ/ٷ�k@"��O��a
��|C���O%��?~Y������l�$C~f���	s�"�o��@��������>�Z:[��E��EOn�]vQ�V��]O�j�ŋQk�n��c�}C�7h���%rZ�Hr��3@����6�,w&�����y�cdAT���|9��]��2���Q��P�@�x��V� ���A�.,��pJ��1�"���1�8��}P?���>D$)#2�`�h�/�\��vұo���k��^�����qއ�¿y����@#(����+�A�[6�?��蟃�����f5)�ޫ:!��v>�ڦB}ך�NQ�~U����k�F�}�8��������{�]�2�:Ӡ�h?T���Ռ��8�����n5~+Ü�8�P�����O���Kt·�2���^Gx4~�A?�&�Wt^��|�R�θ����w�&��i�:>4ɍ=7�x�)3�iL�9��;6h�z���b�ʦ�x��%��f�B-�7-;J	��A�YbI�(���d��	5bʑDD��G��F)������䭄�|us��Sű��=����oR}�8dQ$�M�|��%l�M�������d�ŖQ�D���g��o���H�[�j��"�����D΂<R��I7�ҏvqS��G�M���S��,�CA�B��r�"�.�»7���~[�(�iJN��
[Kݍ���lj���2��<w��d2�n`��ף�R�w<�xh�v�G�i+��,m�%&��~�'u����B��ۼ�����خ4c��1��}U�.�EWp�w{����.��HD55�p�x�������^���PI�T�T
�P�f�l)\�/!�zH��=/Z�F�X}��&S|���j��D��0��^��m� S�)Uo��Fd0L�ڬ�����t񅇸>M�!2���z_-fGJ�.���5[�_2�58V�n���tw� l��b���c`<���Etm^�������-�:�}�:�.︵��"��>p�P@��(Mݥ5����
����
O;ٱ{Ⅻwysr�f���nL��G�ȇpf�����ӿ��K�~�Q����0���JǢWǁnG�0=*�����/m�
#�$=J���p)��3m���c^H.�t�1A�rSd���2I��6���]Y��/J���A d��լ�*?V� �8ou�\�s�x�Ic��_-��8
��$7��[�by�-|�=�H�E~:� O��9I���EUa������b��׽��<�s���z�V�����*��d]�����~^u����+� 3E�g���\��3iѬe� R$�N�^���$�M����5Sor��3�w��Ѵ%׽+��r����ѡB���&��25��ҹkպ����8��ݵ�Kˮ�&z�����ׅ��2�{XK���ҫ/����<g�����g����˔f��	♓�c�C
@�0# E%I��AÅ�I�$N�dE`�@�_�g?@F�&H؊�m[����3���m��չ�/t[�,j�)�`;4�]Fb��_� ��g�{t�ǆ�Gve�	�A���' �p�DW���+�ַ�D���0�Q?� �`M*��h2�@�!���3ۨ�!~A.���u��i����L�E[h9N�>�W|3�>G%��o��ad�Yc>    b���	�3Lf�Y%& uoz���z�Y�0��~�Y�3b �>�i�97��OR�����,���������@����Y��0ĩ��?�)$������0������;�����XHŢ㜢�j�F!�B"�ڎ
UL���~V���i��ї@���!�o?�c���cJB��iT1$v��N�� I��Ì��0���>��U��7���!4rm<�����6>�&���&�~g15:�t�(�.�cZ�Z��WH��K�Z�U"��I�'1�0%N��6���yzT�o��hf���珖�c�U��1V��9x~��1�����Y����C�/ѡ
��{TD�F|㺅7t�@;�ۏ�n�A�ka�E�C\Ƕ��_r��7FcP��Î��y&��C+��ME�R�o*G���_�$3b���6��t�P
�� b�
=V��O����Q�v�	��w;��� �.;�T�G��n��2���o�/�����d���d>��Sql�w�{,��?�mL����)��&̜ny���i�쿤�A`�zҌ�4�s��� kǟ�ퟓ�ƺ7�ôg�S�0z<}!LL^�o��%*~fw�O)nnRL��[������+3���Кn[�+��9\y���@t��nD��t���Rj�ȰꙤ��B�eE���h����;��6�+΋���YV_����3I�����T���-�>a�8�4>8<{qK�N�u��(�a\L
��д��Խ(L�'z<XyW8c���(���R���:��:�p�4A���Sy���\������_��п���IP5F�x���~}��#a� �_��ȋH#�H|��+��+Ol�Է{���|�[m�V���z7��Fv���%��6�DGU�d�`�̨L2��b����H�`h2u��2'���}Q�̱q9m�!ay�LT�'�jv�L��VՁ��t����R��S�MB���^����u�/tG�+s���8-/����������R�b��c�߇�Ke�m�o�g�ı���{@�v(L�
/����O���k���u+H85����T��/~$6��)1�C��Wa~{)_v7;�pg<2tQ��_��*2F�����ȫz�jsN�O��Mf/��d�D�2S�"J9p�!�H4�"�Bohq'�v���-<:�=��u�J�6ϡ�!yE�V�6٪uYr����ݸ�<I���iR�>�ꍻ����lt�K/l�+d��<�j�ld5��FPzO��ɒ"}I3@�S���T���)k�vĽ�M��I�D��J��9��U%i�@�a^YES�pqm
������'�(�l_�䊻(K�U6M��(����Jv( �P�o�`,�:�����(�l	������ĵ̈́��~&=p5�y�7�#.�mz���H�Hӓ�S��B%׾|H ��,�������> xS�ݰG�K{��$З4�{"�{�v��`��1s~'���{�v�'F`q�"')l6'��zĽ���62:`a?dyOhSP@E��+�*�ʡW�ڤ�%0�'�(�&)L�;I�\��拝N�3���z����0t���q���"��Aj�Vh����ou�Z�E�D���'s�����ܒ�k�;��&���~B#�D�%�47��8F��G���G4e�z��uHfTb�Jra��@����M�� �ygb.��aCs��l�e<w�����?��$2�C����M�D%�S���lHG�md��c9I�B�v�-��o�i%ַ<�H�hRB�a�����AC�����hnA��11٬]'o�=����I�����qxS<��Mh#i)l��M�(5��:N��-ĕ��L����G��Vm�l�c�p�3Iɳ��)�W!��Aa�|�B�D����a�"�-S���7@�����zHڂ]��!�MoH����: Xq`��j�u"��f���K�a���N�GP#�"��� N� �r��4-J/�mo���j)Ѝ�AT�d��Տnv��ّu����v�ok����{�]���Z^fUI�'�f>�r \P��ɑ�G�X�Ц�3%\�#�:�zU���c�:1*D	���2Ϫ�1T3pV�M�4Z������1.��T���G�0����a�*sv�jZlr�j]�V�����)/�,f�T3pv��z�^�M��/�aR!�hh#m�:�L�2a�$%����/0���?�Y׽��>i
�}yE�D6;��j4����x���b4r�n����)=�5�8�N��0� T�uY���|y����S��0���y�](�
(�
Z��EUʖK�W�r�
�JC��n�jQӣ��$�c�V��;�}��UMaD��w�;ܼ&���u��6�L���㮍�4�Z߬�����}��O�Ic�u�9^�3V�s
���x��^��+3\ai��+��hjւ�ꇭ��̅y�����x��9����E����wT3��P���yC�xٳ�����p�]��I��=�fq�(�os8�C�涠O�ǻrj��<D1�J��e�T3�T�����]�)�%)���,�%Ǡmm�q���տ���[���C;�q���n�z�:�ek�H�D�C�*�p��m�T3�e
뎒�a Ԗ������`���m8S�M#��_�>�Ե7n��1�O������r�\"��L�9�
��]�Q����D=E �0�)��y�M�lP��+P�x�Sf�>�A�L:n���D��n���1tΣ%���ѡ%�P��8B|���܄�_���	1!$o
��l-�p& c��
,f��*Uf�V/-t�"d~K�����"o?���b�4�=��k�֯��u����M��~5�
�"g�nT3�_�b�f�փ!9����ݢ�_n�h[�7}KS�bM��` ԗ7H'��~>Ɋ�2���NU��ڛ�Z�C�J\d�&q�w�����X��-�g����3_5Y�i�w-��X�/i�u��SU�6Zu�����*�r�ush�(��s�f�p����Y�.�*/���t~00l~�׋�RY_Ͻ�n��uK��ڮ�reO`���P��+%�]��\�G<����T,V6�W&G�e��lɟ�b�SEN���P�|4voY�K�����!��+�I�L	��%&Wb�� <�Ԃn떓��`i����������OX�S�>���h"H�+���́�B��r\�g5�֟���1i���gh���s&ǌ��&�VT�i��xK�s
**�U�iu�V�D�2�Hk��C���d����[�L��� vs����*�� ����.�[E���-a�SHA�U�9$���Q�Ux�7�ysR����� ���������-H�U8�p���̋gEIY�B��񿌩���|9�*/��`',̱�q+�0i�)  ����<-��c��21M�,�Ђ���zga>"?���b-&�c���dៅ�X��pS;9s������ _(�nǡyFƪ�/`�Dh�,��:����ejшT25j,���^�F<�*�l���HfW���'!}ժ��F��0ou���<���H*v l:�Q�"gstW�y*"�b���]?q�T�Z�� �o�ml��)���K��是h������#~�%��z��fXO���^�^�r��g�ª��|vq�r��1���2��^s&�Ν�p'��ڥ�ro�*/�����p�Tt�j2�Q{�>�S��/^LS2]1}}�����5�Z{$��d'�bS�#��x��}Y��sq*�}���u����j��=�C�a,���u��o�#����` >N��E0r�>V�L���Ȭ�'��z����ܸ�I�)A)�Wt�4�7�d��4���kWc���s9=&�N6��|����� �lV��!z����J��#��W%Q��������2��f6j;�4��Mu��H&,b�`7fx�mb{3�!a� �����S��pWJ=;8��3dp�81/J��/��~掮FV�7�L�^8o�ih�^�a��:��j+;8Z[-�W�    �*xEe\�
���^@�T��n(��A�9擙��'���Һ+����3Y{U*[͑���I��=�G#BA��</������?s'G�������S���&�?6/%�SXկ�淯����c�'
{VF�DE>��>� ��o$���9���C@�Ph�\ړ�5�ޭ���մ�A��2r�yYA2B��#lt���3���6iѳ2���?0�3N7^�2r��
#��i('Rr#��B��sA�w��奎�(d���������Z ,��~�p���Ua�X���t`蚚	�8`::j����P =E�� �0�cH�1}̏Ej��*��s7���w3f���S��<��'������߆@1��a��u�v��z�A�y	A`���0�2�n�1�	��k�,�/T'�
��`|��g�lw<��L���Fش����i%n��� ?p��3E��!.��EVp� �֋�WX8�NTM5Xa�.tY)�rL�Ŵ	V��k��-��͆���Eռ*ZT��X �~"��B���jH�C�ōMu	ڭ�����������m����������������G�R����F���2�o��A#y�,"K��S����� r��h���P����obB���)�!{f��AU�p ��X�u��n'z�N��C���{/�05;��	����b6#���Q�
�$�>i�C���B���X:�����ȏP����#��+M��(bvr^��?��Q:�#j�ɡ?�K�M�$�1�J� 4�Dw�2b��(�D�PU���������=�EO�+�*�&M��yΊ̋�t1���J(����s�i�muʴ���_�9�E������d����.b9���Ӳ���7���dc��S�)�i-���!b~��ps��mΰ��Y��π�.��y��iha�W��H�TQ�0O�*������% ���i��ʉ��Q8�ω�!�tu4��2˲�
b�&}y���z�|݂'�t{:�V65B�$���^ĝ��ĭAE7��ټ�������ɓ����<Wh>�n�ZJ���%�����2>˚v^�J,�������|/�*��ս?�����嘽���K�!��x�D&,GeWL.����yE5������.)��S"����vN���i��� :x��vh�9�q����\���1`iZ��/H��m?$�/�ƉW��:�'{|��G`����[6��(�΅��]ݞ�f/e��E?"�g����)x��M�����pUh����[����T�G�u#ԄV�-E4���qĒ�!���q����$D�C��A�x�W'��9ī�����kX�"�b��%U҄l�S���SY��K,q�̀�P���|��W�Vx���X��#+���u7k���C/5�8%���vjQ��ѝ��i>��>K�� �BD�EY��a���E�$��pq&'���s��c=W�)z�JyA�E�ⶀhn�3	��r&ݾ�#����׌��c�T%��?d�����<W�a{���/�{�����0�NV���u����`A��"q��T��Y�ts@P��n���S.���	�U�<t/nJ�x%1 ��c>������?�����>IZ��xE��T?�"��"Q��mq</J���}��1m��O�-��4��B�݂e�����⑜I�v�@�9��>�@�0!q�����9�� �p�> L
�d�Ky���ι�F�4��XQ�ʷ�kr�}B��`�Z���(]̺��¸h
Ƭ��������v��К%�^��lT�ZQ�Vc��#G۩B��A�A��	�`���ɩh��[�ݙ$�UB����'�}й�����.�ZƆ�4]��������Լ3jw%#h\��������NIZ@���󺆓%�N���~��)Ugd9Vbm��\�.�3Ƥ2��H��ϛ}��)���
�~@�Kbs�T����1�GX'@��6xI�T�"5���7�rG>�ȺNv�ghx}wye�s��6���&�e���4��n4����<���>�(�{����]�H�1|������N,v�`�5'���,��D �z>��CmxÆ��<���8�.���u;��"����$�)��xt�-�� �(Su��s+�ׇdm����h�	�Oe�A�����Py�S�SOpoF('1� �(����ʿ����i���"֧g�!>1�a����wr9	IC���}�M���b9�{m�-�.�_ێ��N����`�% I��
�`/�swj�&�}��0zl��W3�*�F/C�_��YN����թ{��Y�}Rf�p�ޘ�(�ڞ:��0-�OE���@͡�+׹��	�}Sܡ�@���*�MJ��u7��pځ��c9���UY�X�}� �UH���b�n���`k6gY/4�Z&��j^�X���F��r{|C�S���ST��{��%�V��.t��(�4��2>�B�_�*P�����PklQ�E*���&��PL+��(���.B�L�!�H�fa!	+?Yb�-@AP��!�ܞ�c�-���E`��nW���5����7{n��By���7v�;�%E����xň�e��G#�/N�J��Ž��<�m��V���(ɒh̥�Ul��w�u���4�Y���c��]]l'�I2�,����xo1�����oA��(J��㹡�5��i���t�Ƀ��ˣ������<�;^:҂�s	��V��%
�WL8�'���Ȱ4�����q�#q��\2�a�,5
��g�w�Q�T��H��6w�pŹB]��]K��p�����z�6�oh���OVB�^I@��Q-�i�f�qf[j.���Q�,�A����V[���%�v܎Q锅����[ј�<�s�xD����Z��.�^��9[�,�8w�a��ތ}��[� J�!hj��;�+s� ~3�����N��WD��i+FO�п�æ+�����܇��	
B>�|'Iن��X/� �85��.6���g稩���"4Z��;N�YdDB=I�3����/����䩠�M4_"�%~�=8�¼�\�.�&�l��=��J��	ܣ_R�� u'�p����T�p�eA��l�EJ7�Pc�$I�Gi
��e����8} �%Qz6��8�1B���
���a4��W8E�
�WUk�����p�sPx��34��>�W����|Y�ˇ�\qR�Y�ͶP�|@V�V}��H	]���E�e��No��mNo��4�0������	��}Ҩf>�2�[��ے��$8 ����-R��ʟ�H%�R4���"�^�P{�_�x�b�T�?�yVy.{V�f�T~�>hLjs��]�=��k� ���ݷ��d"*���Ɯ��
��z�1�U\��b "��Of�Ai��-�J�|��R�%�%Q8"Иj�w+O�T���M��OR��4���z��������qG�;m��ݪ�1�T��k[�g�5�3{���~ᢰb_�4��dpyEa����B�
#N��K��!�g�D�����)V�l
&2��bA�ۉ��9�"����v��b�G
�{hT�	�Lc����"Uj��b�އ���t%�+��-qK(�%p<³´i���v���=�"~��%Kjx�6��VQѮ<S������D�*#�$^��ReŽQ�a�Z74Ɲ�_�Za� 慁��8q�$9��D�z�m�q�q��D��0�N��5�P���ӿ�?�樛šé'�����G�<�0�q���IR����{��Q7�^:���c���@.����t���vL�^�'%�6��A�R�+P���q���4
�f�[3)�I�Q�^��j�~K���:�9�/�h�E��D�\�?���|�&��w�Hoq��(�(���(� VO4���J��0 #��jN�n����]���S��t�ѫ���� �)��%�I��Dǵ��X�G�h&IB��X!�y>��mp~����%C@A�#� ��!�B�C%�;�������V�{O    j{yS��R��|r�Vu^�:M�b�����FS$�^�����+r��)2A��uJǗ�v�%��%��a �]2ǲ��;/>�/	8MT5#P��Z&�������[^��9UP�V���i`.�_qL­�u���H0�b,ыJ�#7*9E~�ą)��PC��3L��*1B�c�u��K	=���z�$�nN�M}dh��F�N��o�69N�����G���䁘c�����"k��5�2±sj�u~`3)��G:G�}�|d*bu�/ջW�m�M!!r^�x��V+�f��D�L�s(�B�Lf�/�z*�+�Y�IƓ-IԀ�~I3@X�I&չbX��
��lx�Z���f�<OO�@ryI�T);�j��E���Ò��'ԕI[��M�!�3,{Fb[�"��Ҟ�}�=�WI-�9�j�(I����Fn���˽��~Q���,��2ƫ�"})�V0ۑAk(4v��*�D�9M�����$U=��H
=��x/��W�$�8�tK����v{{�|x`��6׾n����@���tBG&�7�%y2�F���I40<1�ʋI�9��E%�H:lTGq+6�����E#m��ѭ�g.����������	<RE�<i�Q��P����@;� �IN�����c�_�xx{|�AK��� EӐ*�QZKX/g`O��0Ԑ�#�,�OD�lx�K>����Ygd�a��y��"��ɑ�9�	��!B������������"$�q���'؏`�.���U�P�ÉeX�>���E��O7�8X�m.];�i��+;ms2�F㳒i���܆�MLIt����O�
��eH�vJ+JQi�݃T9w�z��ּr�{q�59VE�x罋�;��%a�ATٝr�R�\�q=
jK`�{S�{�w
"JQA�:I��&	s���Y�14B���>��;d���m������d�;U
��U
k�c<-��S�G�簚ta�}�A��N%F�`%�w{� ��1��(��E��u�7�|mnufw�ӛ�IEh,6Ȳ������-eD�m�����{�	6#c=Qz,?{=��	�8M��ͪ,���/�J�ۺ��Mc����{�:\xp���;�׻�Ք��d�6��U��V�E {'���Iz�/A��30��:��9tmʼ��{�~��5�߀�?<T&.��s`��.qTlT����=,쒪�R�yhkN�y��ɞ�'���n�k���S�׬v�<�]�#�#�� �sĳ@T����I7,�I�GG�Q�$H}I1��D�������!H�+�G�ۥ#����yh��6"��	��܀�j���[��Uo�r�[�d��n*Z��Y����x�����&[��+�Q����
A�bY�=U8Wߠ7bMD�P�-�p�(�l)�/2v��8�՞����o�C�;�h�71�:� �G^}f���@�ui�:��A�g��̿���X��?���\tGP��R$�'F�� ��dS�*�	�h��[иv���s��?3�8Q�10|�݇�� 9������52��H!��݌����@Dz�0�(�C����03�F��D.:�;~�T�i2�O��������Hqn�	q��S������Z���$�[����HCs�c:�#�UR����+}<P�V��� Q{���B$�J�L1��n��t���Ek����o�P�ŨFE�#�a�ۂ%�h-(�GJM`�P�v���4�(�m�"�sn?�L�k�B��8�rIa�巕[�q}H����GU��JOO-2憠����"ܡ��mO�X+��zzk�{�������ϰ��5����h�z���L�����e�i�� �TM�'&.�����Pqa~�4+;f~��j�{���Ȓ�	��_auY�)����A��")�
�ć$
N��t��S�$%j���E/�`6Y�r��4jV���'�K�3��N���{�F�d����f�������9����������r%�����Hq�(e	�&	iᄽ5I����G�I�����Zi�]��.�=i��4��\��j��IҐ�V�V��B}9�t�k��H�ZQ�$�]aًl�,����5K_%I_[�&	�伡�ܰykI�r�\+��8A��63aowg����ܴ�g���k���&܌�Ǘ�~{��R��g�$�M����٫�&��E�:���n;��T�5^_>�G����
F�s%׬�:��V���rT/���j��K�S�_WF���ʺ*���0*[A�m��8���s�lAD>�ٟi�z�0���gf-�ߜ�(N�)m�Jߺ(�>g�Eo�(���B��R�������̺�p�
�v���ŊG��u��"e����J�{��6tZ�������!H�YmF� �bϧz�wv�Fˑ_K��Ŕ������`��c5�>LcբF���;qd-�a��h�Nz�Yϰ���*^�s��M�
�W��(bq�{�9VE���m}^����G̤]��O��9(�,����q~A�֓���ÑÐ��䌄�Ӵ�4ù�}�0~�z�@�����p����l��p jt{pf��:�}�l:^ �T�^�O���i�L|}5�.F��.�2��b
�>���,���6�^��>aޝ�a��ԧ?���6�N���l����t�|k;|�p.�V�y*<�.�GM�p����6�18ɑ��B��2��q�x
���z�0��̀x�?�M8��O'Q���3�e��vT���'pRJ���D�2>��t-�=^;z�&g\�a�e�a�G�O�o�_�^��ͷ'���`�OO����Ƥ+��Q�2�wN㥍�s�ۤ�+譆�V���+�s��h��F���K���BC�\g:��lN����ͣ�{����."pJA�jH� Jy�T�0��)�~���0)�iD-��S�W��:`݈���c9b�����mV�0a�N	}g�pޓ�����~G	��*����S��X�.���Fō�GP���M��Nw�5��.�,*,z�̯�M_}b�5�<_ȵz��x����Sdy��1�|Ǽ�ɪ.����%��7��dĨ��;Ӆ>�mȈ��Gh�����Ȉ�1j�[��˟��K>$��{��A�jS>T����E���@0��s�~�D]*vh"(b�oR�cIM�i֊�����Q��1(����5s����o�CQ�%�����A#z^Rt�~���fd�t��y0C6������.��z$�|��_z��[��������l�<F�����\3 �6u�GsV$ 8�o��#HG�]���׫ٖtPT*C�������2���L�߲|��_Bئwɇ!�[�7�\�e�W�݉�[Nb6��H�1u�T�C�5�\��	ʎ����AQ���/ҡ�&��72�&�8#�G+�n<\T7^�, ��.���?l�53Y��-ݿ�+c�8�	��έ=�^���o�񣋇��j����B)�09����P��(r�@{	��m���rs���������@�ʕ�邏F߿u����=��%������f��X	BYT���mz�,nX�K��)��t9Y�,3ˑ����x6�ן ��F�7�X�m�SN��D=�N�(��Z�<"��W$M7�w�u�&��*�Kq��8�w:��������3�xCl���Y� ����7 �2*�(�Y�-ͪ�X�6.uwA�;ؖ�o$I���3*8��N�^�wjmk�L�WeM22J!�a�k?1�C[��_�Õ��r+�V�f]�=Vκ��t�k&�r�|UZo&2`J���2���HP�ʻȪ�{�aᙀT���%�FJ�\�lsRl�Ϻ�iw�_�[����j�Uhպ�v�U �B�r�"�Z���?���v�R,��/��I�m�k��]L�u���Q��S):Ɗ���fG�u�k�Ү5�i�Û�mL��q��do�yt]�yּ�,��ףJ*rŧ3������o��("dA"�f���T�J~f�"M��O%Gً�qи���ۻ'[�W�Ik��\�N�nlof/ʸ�$=/�J    Hu����>��w�&_���ٚ��<�w���O�9Jb�Yq�Ȇ�h�R3�5_i�q�*��:�3�&j����Y�B��l���@Q�J[|0eai��4'���(���àTxղ,��O�[�̟�g���q-c2�]����6>i��C��p��>қ��kT��7.���c�f�V;E�j%�,��I�g�J�g'g�f�B�$�9*�!��SL�G��+t�阒m�36�#eZ�\���p*	v"%�t!�'��$}Ci診�熢`�մs}�Tr}Yā�(J����F��j��FN񌌪O$e����M�"��l���l��H��GO{�{h�$�􉴜��̭���U�ʡ���Ak)�59!E8Q����X�_ϼ�5i<�o̛����2�^���ɒr;�-'��q; K4�x�)��q;�˚�7��(�
v'$�� ɨ��f^SC;�.nb�%�z8}I��n����8�Vz�Y���N}Ve�?,�W�t�C���
o�s8�6	߷�����L�;u}n!D���@ݔ�k#thM��� Q�+{[�N�3=wN�zu��������j>�:gVݵOׅ���ٴf����i�.�F�6�C0�.�K��^�-���\\�h��ZZV�]o~a�3��Uy���V��_��~T�mVQ���І���n�@)�@��۫���]��Z-#5>%	�g*���\3p,	[wG1�g���^�V�L�U�l5��6�d�n�����1�)����F{o7{xoˏC�9���bB��5�7��V�}�Io�ʍb�٨��\!�����w8@f+��a�Z	��<�%���ۇEK�,Z�����jc̖�aP3����߻��9� [�9H�t��:@�R�gv��M y��J���5�v����4��cU��|�XCMْ�<�z"�x��yc�^���1=�5X�<㥳��Q�FV`L�[~�k4jq���sy챓�A����)O���bah2�Sh�X������[�=:��i��'�u��m��.j�j����|�|}qֽj/Z���y�\�:�I��:�uS� �N�~�lQIiu�xJ�j!;������Y4�z�6�RT_@���8��UI��xM���&&�)ވ������Nr�5�Iǃ ��a�׻�|c��/OK�_�ѝ1�!�g�j��A0�r�#sPn���BM����,)h�$&Խp]i7P�r�d�@��q��S�iAT��_��T�nD~�H��|P�'����1Ʌ3��r���@��{�#21�D�a��%�ћy�%́i�%�$f�aψ`��7�p[������2=}��Ck�����bj�\������z؇OD�'��Щ���(�$�V%xNL���tD�I8q}2�9�7�jw�5	���S��<AD/�ak�o��j>��(=O�k��p�1���E���q:�|�h�jL�`G^6Vu�ܮ��.���m,��M�
�a+&.�T��t��P�O���yU34����(�b|j�Y�J����!���1i�]a�Կ�.�O��Y���g�K3�Ĥ=w����O��9��n�~}v�7�{��T�uLq�<2��V��c��6�²^zH	߷���҅���Xd�Q?���w|�&��٬y�3�w���R\6��0��J��SxMR`׆ŗ��HG�����O��*���R�����:D?�=�_���J����!;V���邶?��r9�_�#FI��䛥�#��sP�̣xu�3h�f:��Mƾ>4.��/���HO����2�*(����`��ǎݾ<��/�����_ۍ�7s��[�)�`RU���~���pp�>��`q_<TR>��OzB��˿W�@�C�O��S��
?���uF�A�~�Ŀ����k�Щ�&��!�S�$��S"H���س%�a��7�U�{3�S�볗�k�N#��G�@�HCW=c7�o����WI�3�W��44-��N#�3����{�rz�\U�zN׎(�R 㱪��w�1x��ap6�̀U�Q�^��ggڥ�2i�F�E͟��?Ϟ�M�����[B|]�RH�7Ck�ɵ��ǭr�C;�	ќ��F�Kmi����j���t��+�7��^�ݾp�;��|;;ӄ�n*"�Ȃff��q������������G1 (�+������;��AT	�a$FK�
C�-ˣC�PJ����RA?0�3�>%3� >�SK�<���eI5(��&'��?���I�1(	��3	˱U]0���T��G���UD��kZ�>�A�Bސ$I�Ҥsء?� hy�<��M��4iy%̢�A�\�4U�k�d�����3OA_�Sb*N�7�ku�93=����4xO�Ța��4�y��xAL\K-{���,�ZP�����D�I�J��$�'��0ߐ=���Z��������m��l���r�{��0��� }<A�o�[�<�N̹���0��ڲ�l'����.�ہ��5�ew&^]rIEJP��*R@@]�L����dlŶ!�oI�SH=��\���)KL��0.S��PS"ұ�(p$�;�,M��sO�m2�z���kRO���j��d��t9��c f��x��RaV�&�͝����n� (Ĳ��~t�2^�F�����^�Í�{���m,f\2_�<ː�Mi_��m��D��^V�{���y)�A�'�Q�JUW7�M
�c����ژ��u?a�6�H�&���y�
�,�|�Aj�T�05L�`�1ny�p�)� ����B�}#
Um��I%�bQQ�{�Q�^ӊ�b-���wF+��R�:�t>	��AVf(�4ڍ��8��`mb���8"(ϴP0�q^l�dr;����v�z�Zܮ�7���j}���i�K�neX0s��v#���/Y11cIRTYA�����������r�tjL�Q#@��9��ox3�a��LЗ�km����'-U��nh��?��5C2�̪Cj¾F�ڰ����(M��ۜ0�K�̼��a\H_3�K�6<+��iys�
F:S(�暁A�����K0Ґo�at)Glw���K�1�Н�1�F����$b��?�~�%w�������i�����o\3Ǫ!�vS��8]0Zgs�,M���ҫs4��cВ�ܝ9W��G6���;-/*ϣ�y#tR<��D:��QM	(�0�4���̛PǠ��E�|˽[�����*`@^6C� `�o�.J����ln����'2w�v�𳟻7�����m��NTQ�"s�o<F��=�6���[e�W'M�se��N� ��"�z�q�ݖW<�Oe��3?q��ipg��.�0\x�Q���H�d�r� ���B꣚�QLT��^�:�fm�J��f�N
zK%SW��[=�̩���h��Tj�F�S�w�$���6+7Éi]�V+�%W|nW��S��^a��y�"���а:��":">���!c�o���W&���	���٢��[�s}ih�Ci8�%M��)E�Q�d"��/��c����ܒ;���S}�Y��E�r�R��1)YA�S wK��Nf0�G�D0PL�d��{�=?�`}�Y���}��ƓC?�b��c��o��GmBQUs���{�ύ/�����l�͋�]U(��h����f[���������b�|.���.��z����)X#�����f�k��Q�
�5�d��@�A�+��El��i5;�!ŧ���	�\3�H��E]u��S�2��i��g�ai��UA�꧉� `��he\3�Om��^���Z[f�,\'��n:W~;��)l��&(r^4S��;�蝾�y��8^����6�{��J�y�ϛ]SCZE�V��c~�d���v�@� 3q��C� \�]�K���6{h�Q%��b���f���ɕ�\�]�'���+�&��^Y��f��CM�O;����"n��ߐ��0�L�m,���uIFL�w4s�	�3�2��:I/���)MC������u5N�7ǧb|�PtY�?>���Ń��    <h�{|��1F�dC6�o�c�&��Bһp��dD}`����c �};���V�����x�����)�4��w�����m2��?�$E]���t�-�Dm�;��#iyIU�����Uw���4nz�������q�X����!237�)�dJ�&��1,�j��ţ���[�RN�F~e��$���ﷂ������-n9��L~�����1sdbM\�]̊��^����r��u���4i���I��ղ�����̠�L��=� �� ,�AGrX���Id�3`M��/�^�5���Ni ��M 	�r��~��[��O��}3����X���e���B��++���y��h1���V��2ׅ�y�4��[�a��f���"<��\z�3'��\�8g����b�K�����l��]�Ԝl��G��Ce��� m"�S@˜)���k?��`�x|�v�Z)V:��Q�L���vX3���ĥ�9�D1�8�?����Y8#.5-Cjb�gv�@d���s4OH�:�I�yê���a�8����J����/�0iş��b�ھ�L��y � ��`�a��V8���$���FK:Qf��t����b��Zgf����(�\=ɪ(0�A�벡`J���
v�F9�����l� �"��W�;Z��[�}b��"
���#AqP���@W�R��`�'偗�}ܝZ>�J;ߊe�>�0Ļ�Q(w%9�ӡG!\h<9�7���	�!�k��I5[�bN�v���p��^��Қ����ghq���w���$ɵ����T� �[��:��ׁf*Uљ5+��B�gp����	�;��譒�Y���~8~��A�ECRt0�UY���	"-���&"B�?�(��ېK�˙C�`1<�G-o�8�:!\�p�2���֙��1�!h�O*��R'�u�b̹ﭝ��R������U�[�^���?,O�2i�d�s���ձb���&[T�X[O�6���O_���SF@/��ܾ�F���[�E��v��
�ӏx�SB!g6
��961k��P���?2!GOJ�ah��&��.��.��cnR+G�uR��_��i��W��5ɵʗ��*6��z,5k�l���Z�!k�#i��C+��b�1���	�|E���-������������(^%�2�P�(vP������G-NbV%���ś!e]�.�(ɂ�ڳ,|��6�j����6��K������y�ux���!2v����g��zQ���}�|���pl���q�H��Z	Y~�b	=b>G�����_�#V��Z���`rO?��{�~2�_�{�����>�ȽO�3r?[�T��u��?k������7#�M5�WF�3��aO?�Xm�ND��>��v�K��o-�}7�����I�x�؂�[+����:'��K�"'�� 6'�	M �������`��p\������X���>�s��TF3�r�����?6}��ztH�M���N��E����.'��Y.�O�;s��h$V"o��$�������/|�x���;�H��m�H����4;az<̦��� �����Չ�~h��|�<3���-Ə��!B���Ҫ��$J���c��I���`5ʑ��\�ޏ�t�Ex�U��HO�����d�}�+�N��E�q�.+HM�I�*�L�ѝ,=��	�d�����=��=l�o�k�p��A���*	Xy�W��T'�.h����M����7��J������jwM��Ĵ��X+�2z���Ȋ����P��BS%�Q��$+O�zM�	��q��^-%,XŌ���((��_X�[i���DZ�h�mc����2�z����VmSJ�"�HB���7����3�npʥ�C����B�����|`)�8��}<�ZX8T��,T��uP��e��FዉᎠ�;���;C0y�K��=WR�B� (�Ҕ�A���+��'0w���ED�~�^�E0�2�	�)��0��%%�Z2|=�_��Y�şC�d��<&�4Dn�x���*��J9�]x1�u�4a�l�uGs���������	�����x�]=@�CX}��C�^�Zp,��$}�P(e]�P��/�cICp�#�ߡ8]L
�ڛ�Z�R+��8V��)�*�j��<5�n���������Ǆ����8D�LA��������u�P�O(�ͥ撫n�ڕ6|"��X-�o��b��@t�!�A�N��b��,3?\\,T+g�"�$g�z�ʊ���Vr��c���uWDUᔅB2�P�	8?y����b(ʿ���$6KF��y�{���.���:�kRFD2X��೪J��˟�s�Y�k�Cچ�C?Y>X�8���}LU o�Y��Tf��(��B�44=њ�M��ĵ=�aD��N��c!�Ū��W
�Ggϧ�Vw9�
���-�2)��I��t���JQ���VR���	�̱&�|�"�4B�x`K,�5�V��`����a��g@����'U��)��v�Ī~U���8��`JR ��S���qۉ�MH�;<������s@Ǉ�D�4�*JzF]�˥�\>?��ϠfH|a.����#D��D�o��,i�5M�KjZn��%.���_�Dlۦ��Y�7z���N�T��/oJ��vqW���yY.Fs�LA0�p�{�p���pn⬈|)��HGҶ̼h�'�k����Ph��ρoǓ�4(5�̇k�9:�%���Q�7B��	�L*����_�(.ƛ`QQ�A�'��<`;�t������p#س#�G�/8�J��		��<�?!��?�`�ja��܅�O� F�ӹg��#lka!7�a4��HݒA��Q�яc�ԠzZO{ÚPk���.~�����iY�o?��+ܫ�`T�b6�Nwͦ�Y>yE����%7n��jNL6�
�/��7�ժ8}6;��^��Q��.��QY�趼3+�!S����p�pt���q�2���2E|Ƒ���%�1���9��qJpVH߁�w������GHؙ�3�:�׷S��zE�'�@(5]Vta?6����6�\b�~`.щs@���\.\�n�N����O�y�e��~�q�h����F�)�9�P�VUQ`3x�㎵�@�8��z�Uj�R�\W�ו�*�
!�/trfL'�R�"��vV;��t]�Uu��r�n?z�Y)�Q΍��*�*(Q� �q����q�J_��z���W�!���a2GV�p^5Dx�"��jK��&�e�WY�L>�]�<o�\Sʃ�d
�C�ߢ&���D~���7���!X��4��Q����M҂�fEҸ)�尀#C
g��4"� ����,��&UF$#+G&)�c_1Q	(? 7� ��|'X��l���Ve�c���B��]`[Zs�{!��b wF0�q9����d�M�����ꁏ�f�?�1^z6\$�K�x	���x�h���a��� �
�;4_�.�F
ȋj��Q�[�o��V=M5I�b�ѳ��)ʏ;@��`q�
��ˊ*I�I'�;q����N�����������KkK��O���%�����Y��ϝZ����w�܆�;��������#ŷ�UhnG��c�S���<Xg��!��'�4��;��cB��m��M�T�];�ͭ�aĨ�H���L���"�k<�Gga�����9�z�u~�PGW��Ȉ�"�`Y*���b�k�g��|��<C�9����~�������xg/����U�-���G���7��%��>U48<���4����Ê����,���4�э���G�mB��*3$��(ʽ���r�+]��7���Pܚh�U��3 U��Ǫ�%�y8�0���]Rsv]��8�F�����FP���4��[�DG�ޖ�����o�@��2�6$#U���w��b8mo�:���[�r�Q�]�5�X&"Bq+�/�eDs���L��p��w�����|�tj��+#��EV�l�f�w��yi��8>l渡B}j� 8��YY��S��    i���Q�-�!�� �!���ioP�x�|�^7fW�t����n+� ��.�>��nn�inӓ�KdMC�MK~�'�E{,.?bX������Y5T�2���T�u
U#�Ck���5u7�%W�.e𫤻��������sM���VA4�`�r���7B�=x�ܤ��q9�4������v�e�534S42�����]TT"2�\v�TTOw�j�ڬl>�b����K"fo���mr]iu��*9*N��X�P��ۿ�XZ��T%	��q�W��tM7DY0a�Seܞu_[�e��ڪ3�{���ۉ�=�v�ʬ��t�li����߭l�XҺg	������O��M��p� ����'��4m�io��7�T��  �`������vD&��w�X�'F?��94+PɆ����|����x
ĸ6�0?	�#k\d
?��HJ��z�3�'̦�
�7�Fڰ*�j�GWr�%(9˒��P�t�1� X�W�8�� ��a�"χ��S8���u�T(���A	�^�0pR^�5A:�%m_����>�I�X}�H����~Ҡ#�P���>���TD8@+���3��˟BW@�z��X���4k�F3�����>怟��|d�63�(0yHJc��
�[i��Z��=[�H�Xr�p�O���W�m��ǉJ�����zs�D�{�PّL�BRE���4ѥ{8���%g
��"���Ȋσ�_���{#�>Z���� ����錭r���ԁ��ɝZ�; e��?~~>�0^WԺ���d���	�Y�[���_,u^�����ȕa����I��xW��ba��A�w1�Z���EN�o�	Ș��<�ص�Vz^dJ�
���	4�YW�]�L�����3o�L��"�e	��� s�+�K�:�Xn��B�$XG�y�+��,ddaq�A'��s�ڑ�\���pE�p�ʡ���|p0��������i��!��P��������k�����c�I::Q�� �C7��p�\30X�gY�,9j��_a�T��{e�"t�lho���*�!*�dh�ўf;d��go�/�!�=G+l�F�Ltν�8O��͡�`_�����p��)i��<�B��3��@�TY �2u!<�|��� 6@�ͼC�3$;��f��*��L�0��޺�s����.�
ud|����������[+�o������l<L��N�*���aq�e�zPET����\^�K���O��n�0V�=ή��u�q��pvԲ�H��	�]�SU%�q��1PO���_�uz��	�_ �o!����J��*�ڃ��d��KB����k�>�[(}��a�hr�$�,��԰d.eK�2��O�ka�	f���&���f�ㆿ��^,;�3��GV��"����
�cz��̰���9رh�Px�$�L>zPD4d���],'�I����>l{>��K<AoU�@_?���B�� ���`�����a?@�S��!w��R��P%AБ�������1���L�������0�@��v�&�Vp`�P�^��^d�/�NA*&��x5Am��|��o'^�a<�즸X>U��y3��ϭ�˧YCY/4���5}��"���ջ�v���cHN\B�r�U WOlӳ��v=lu��s�E��Ϊ�B�T�t���ަ�NF*S'���^UVA�u��w�e.���z~����8��c�iL�|�/��YU�܍���I�o�7��u��y��Z�Α��"7��h�2:�*�d��`��%�"�+�@��32�����I�%J:(�/�Ͽ]s�!�b�
����r���pj����W*��ŋ�U�r�T�pO6K-��f\.=��	:-j���(O�cn@{�F��M���N����YT1�)yd�(�}P�B�˟_\���M����؋"��s�<8]jx�� ���t+5�Bo���Fةb�gg ���_����␺x~L�k�A,X33���DQAJ&�~�^Z�P�Q��&~�m(I��Z2;��� 
����/+?�6A� ���'<6��T�*�r���Sc��U.N�3���85#�:�s�%�Kk��`a�0�Q��o��N��K� .����Kέ�Uz�K���"��SR49C/��!�)p��7�^���^��}/��!����Ղ!�jF��z�[���N�~��D�@�/�*�����6	��*��Ww�.��m�Ѯ$��qm6� ��ڭ��Qe�������g->��(���J?5W^oՓW��Z��k���jM���湅慉0���*�[����8��3{e?2{iVmx�u���~`��U��8��b-���*y	4�X�f�����wJ$���\���@u^����^j ux#ۜ�{Rh�sf��m���9�x��Ƈ/g�"=&��Rp�%�I3w��E�DI̼zcldHJ:��'M"������y���<h�'����7�_-b�f�` W
p�/B�D"��Y���>��%2���۰�%���0/q�&}&t�K��fk���_� #`d��q��Y���b�R�Ā�s�������}t�KV���$���U���cp_��6��ӏ��� �#�4F/��3�GX�{��@���L���L��p?�KۛL�Z�v���8�����c�Ng2���x0m0�"�����K�Lg俅V����L�Y��fo� ;��O��E��'p�5�г<n�$B�޿[~n�/������7�O���Ҟ]x݇BWj�z�%�#�@�$]2�9n��!""�8���;��g����SV�:�qcy���v[��%ޮ %�ʕ�n.�ݫ�᧒6�lXϵ@y��&R��:3;�%�����SXfdL�=� ������d�^�D�q�ׂ�����woݬ�1�A��2�X�ו��'OZ�:7����b�/'�`��SxK���N\+�#66ZC���u�Y����Bh��Hћ4����`hN�*\��5.��&���W��՝3y�����__�����ux]��,^y��(_:��`����B��Ѡ�c���?;l� �p�L���{����~z�4o��SX��VԼi��t rE��8�P0�q&i�ܽ�\�Y+.�����fW�O�
�,�5��j�`�U���0r��y�"-{��`���R�yU7�:�5� �:X�C3���'��l���s{�Z�웂�o�Pq���5}�`��S�r
����oNO��׹��#�Ƞ^+��k��A"�"(Y�wC>L�&G#i�zW�+��?j��F1��c�?P�5}<<5�9Dc�6N3mZ���\S
�b�nc⅘t��������YXQ��.;1������}]��6f@��(s�_��b�}M���`:bN�~�l9��5�Z}ն�:���bz�B�Y%1����Dh�ajq<�6��#V~2��C�0P>'��ɹ7�ߘ�s	[��h��%��>��\�/'׼n�׋�o�{�?!t̮6h�@;��_
��Ո��7ߧ���*D)��PK�S���a�w%2�!O+N��,5K�h�������T���.�X��E��C%62�6����E�CL�B���ߣ#�R��2�:0�<�#$�`V�HZ�d� ^$�S>=�6���\YI-I:j�rq*�n܅�x����s�|T	��pS��Z`� �Z1�JH�!��+�VJ஬Hm`�����+.�1.��Ty�Y	Lf���fR<�7�攧|�Jȶ����p�n�{C�����)�.+��u�]՝�ދ0�2&}�l-�M�����++
)�i��H�����������yO�Ը�Hj��'Q@�nh��AF��#��t�Ɠ�tL%`�o=׳n+�ܽ���:,�b�� f8I����^�6�w�[G���6B�:�]B����M]6��r�>`X�V�q�ȼ��}6ϧ���	����������5��7�k|M�I��>��-��;��J����0<��S>uj��Zf}螝{��1ͣ��?(j\30be�EY�
������)KυT�    T���C*�y@׸f�k��rԵ*�(a��җ��_���%a	 (8���\3�H��ɟO�5�[3�d{�~�d��}9�ԗ����^�Fb��{����{���me{�����4���;T�L	�5���o�^�=Il(�^�E�HO%��{��ށ�.���Q���ȭ�W�3��6��7��y���`KCw�`".:W��3�"f�)A��E�QK���@�8@�<Nb��jbO#�1h�(���eBQ���8���>0���1A�Kfiˑ�r=��̚:�Ob�ƈ��?�S���S��J��#F�+W������d�'�ݺ3�o�I0�� ���T��R~ /�a��!��� �h�����Z����VM��i�M.Ps�0DCF�՜{��>��tR�Ŷ'�t1f���J_Bh*�x���amk�i��L�/�ai;���|�a�]��Q�&z�"Mx��,�Vw�'H��ׯ������|���^9�\��K�z�斋,�I~$���;��
r��\��������J���w�B�G���`���u�C���7N(�Z��.�6��z���0���%7a�����,69+�R�҈X(�>[@���.�����J���в����r�%Y,m����k=j;Q��p��WЀ�;�,�!S�%@�|?/����.5X�����6�m���R��TYW��8��N�9�c �V�S�&b���B�z%]�����	!��yst2h����:�N��S�����t)�����b���;�3�L*L��=͵��)�S���ReЛ��2`ۅ��gw��˕Ŏ��]���vl��㫴f\哑5�^���g������t/���I������g�1�"4��ޭO啦n�>K�ݹc�s�cϣs�q�~B�x,���ʘ/3�؞��f�l�(w�M�}=� ,µ��}�N��:��fm�z���J`[J�"������.
�xSv���u��z�e���ؿ`�����	�	�(��ʿ���"Sd�x�M&K�)�p�>A���$�bp7�eK�6�6��
�B%(%��+�,�M���4����gS�y�k��g��6��aF�^Ɯ}:5�}B%��u�`IXK�S��qeM��$�`b����Bel�P�C4�]��'�ƤPf�Ѝ/y3��;/��G�%���Er�F�L�-�EYR�:-���wYpa:�/�������''ķh���T������T�ܽ�Ȏ��+��.�|��U��䰍�Yv`"l.��$L�\p'k�k�L�陠(��Ĺ�6A��b`$1���^�
�A��(�����!�~�=(I���ʉ�����,�Ť�4�����[�*��*�3/I��PF������ܴm?_������e��c�b�0l�����A:Lgq�d�LN<�����O�Z�S��e�¾�]	w����$L/�zު�M
��T�'O�� \ϡm�hTn4�%,�Ih�ᐃ��K%��F.@����>nCQ(
�q�$XbE�z�d�,&8 �ɶ��Ww�ƙ�<՛b�+�>]�=Qz�\?����S#R�Y`y��;6b��MTV3������B#㥳���8�H*Q��nG����{>�@ȅ9��1q�
�n��r����;S>�G�N����V����e�tl��ۘ.Q}���)�#��Q�T��#�Pi���7͜��+qk�ٕ�����]�DN�����~�/A�u΀֟вr��:wgg�96���MA�4�C���$�40�!�v
m�jRW7�S�s_^=�۟�"Յ��teV�H�KD�5��h�:���^��P9��4���"Q�ߵf�8�	���3��1����� J���i2T>�(<5�U�y��%UK/��.x+��v��/av
M2T�ɱ���c~�iؚ�b�A'	*�1Gp����J�����S�(�j9�K`�xT@�
�|�����-l�j�����H��|/*�E�x��(��f�&upZ^9�y�ʜC�4����q����u�������T�k�O}�1�.O��Pz{Ǒ��	�"uE68���4�%	��Sh��Ax���,�u����Gս����^���a��î3�s��Y�j�}�U���	k{|�0�b�5�β�}��כ犲�KM�dE2��Β���Z���D����6�%��p��w�z�*�),v� ��)��Q���ҹ �Rn�B�L�����B��R�]ݩ�@�6V7�<ԅu���5�����q�:fH�&�P�mW���P�>�M����f^��B�m'�|��[)����y�o�[7��p{:����Kq�2�5�����}Y��@L���c]1���0�
�����{�_^�yy)�(�_��~���0���=�b+\��v��@��?��s�� �4]-в�N�pZ�lP�&�����_�0x��������Y{��b���;�y��:o�8*�1|�I
�a~���1P�v�$<Q���������d�ҧ]04��w�i�|�'�$u�y�$�ɾ�	�� �-����~9 �l4gЮ9ͱR{}�89P'Sa�e�����"G,M�A�6bN�5=g)r?�hY�mM�}���N N�3Hwe	���%y�i�(�r\����W�%�&�^G3��KANX�0ј�ǮC�Q �������:w������ɓ,0Kٚ%y�Hm~�h��ѻH=-�<!�-�Z`��-��II�D��7 ��f:����B��ψ	���]y�}ŀ��F~G�̀wq�&w�����+�����nz��Z�:֨�z^�U۟�5"G"�����	(K��ȏ%#����jy53s�\�A6E�	�"�V�gQ�l�E�  u=�$Y���$`4g
�!b�� ��~��� #�����zv�jQDaT�b�(5�=s�X=9�6�-,ـXݬBEw�����ğR��p��e��DS�0@�U������3�[��i
�����5f�!�7�U4�D�=�Y� -ϫ�ϣ��L�_�
�����u}S�����n��&H��+j:���}Z���ַ2,�N��ޭ�����c�?]��[qV���:`2f
��r�.�F����w(=q��I�E B�Ź�M���YbH�e��c� .��	I�r����`T�t�8�f�9PW�fX��t�3�G�����8Ů�>,/t3���mg^9�y���Y�~�I?�V0��gz�)�r�t"r�E�O�0+�#���%�Wv�b�!'��hc	0�"�D���	�D���v��y0C�.�\X���z�-)��ɯ�[�F��S�3ܮ>��!y��a<K�b*��x�FJd�Ό��?�q���&�$���L�YSהn�ĬbQ�R�j�h�b��g������4���5_�EO+di+��C�-UDrTC�
��r��͖#�A�t����z��E_E_��E?��$����K�#	_2}�%�$5��.��9���K(�"w�B��J;+C�2�2's�	�*r�)�ʋ�_�4���D�@�u�FiG�Ҁ�]7Z�2�������p+~C7��(���C�#�ỷ�*%�ڹ�R���":������-3�d�����[�Qɋ�
�����S(؅N��T�����
/���)\Wy?�L(��DP�-�=���A���&:PS63!$����2&�<1ºP۝}�Ӕ�R�A��e�9X�ܫa�&����'b��VnK����	o�W��W�tZϊZ����Ew~�;�l��ۚ���F�j�3��2�=a����?�),�^��d"&�ɘ?�7#��hf\ۤB��x���������]�������Dy9�;��h��tPK�E�m��l��f;A���"�,/�F�6F�b�v�V"�%f<�c�w0}��7|��g;�X�)��6��9�U(��Ba�-a�["I�7-�Jnݔy��yƪ��3Y��1�j#�R��~��4 �dꦉEU��Մ���� �-�!�����!��� �  ����K��ri
� %o`��QTA�:h�X��АǞPs���C�\de�`���l&��]"�,���H�,�����0	���b~@В�mc���t��k��J���������.�o..�nڠ�R"�	i� � ��q��L���q.����(��#5�Tf�Yݤ�7o�������B����r%���O�'��7ѹ�c�IL�8���%��8��]=\�{���d��7��w���B|,�&d�@�(����N����^�<4 /��p�hw��N}���T�'����uo�+����M��|5Vw�x�-�6;�s��bj����cC2�&���,����O��p$��l#)���o����/����B�$R�c�_M��o�=��1#��|��6Y����s��[T�0�tFsN-��*�Ȟ/'q�8D.6��1�>CR�^�F���v'B��Tʠ��&�����)_Z_�wT?a��R��h�I�U��[҃�λ�R���7Ĳ��@�O�]��z�v�A.-���'�'�OE���zX�;,*�DZ�$&l`^8��]�d5N�1�b5���S�w��R�aTb��rN�6�9�qQ^k�p�k���J:��9W.�Ֆk�� �� ���~���m��X�;c���\����J^�������ӁUHȴI�a��`��S�	�/��`�NK�e��o[�q�7�XS���b���ެ�Y���i;�b�A��(s��auf�-]��v	�d�@0=X�<t~���~��}Z�/R^8�������{�s�ӗ��t�ƺQ���c�>4N�{"0hp"�($�z �ڻ�V�ď�b�[#�r�1rTᕔ�e� �p�~�h���Fo �x�-_��8+�q�ס�r�N�nMs�D$��S�.�T,�y���0���B�R�NH�����GJ�Vc�6�B����"��y�P�X��k���y��P���|)1����n���\Ȕ%�;hzx�h�Ä�mo:�0�l!�o;I�6>ײAB����1Pegg��t���%Gќ���M����.y�Cb��R��Z�*�(ۧ�GnV�Vs��nS�ɪ�������m�������|�y$	XR+�pD���~��۬~�YUļ�2i���f�{�*�m�e�T��m<Ď���w)����,?�>7��yP�p��A�EM��g�q�@Wդ����`�J�'��['o��}X��*",��.�w�U͠��Y�0��f.����ʆ�dj}��F�JrN0-e��#(M`�x�cݯ��]gy��rQ��L�|BN��9�U���q��V�0g�&�/�����,�gyb�a"���z��xmX�A�2�2�q`�<������ �Cק��:;i������o)�^�itƛ�(�	�XN���}��B���ғ1x\#Qӌ�������1���Ǚ����l�_'k��tY���ٝ2��g4ɖ�Q�J��584�6���m0D�=�MW��C��y���T��O2��!��d8�����2O˻�C*�hQ{����$y#A,��ewpb"�u��t��Oo�����mxHUq�eE���M\30:}3��ʝLB�%���m���r~]�j<oF0��W�{�9�u�?�.�(�A����F�S�w��U�pY頋��v��B����2[lG����^�hp4톒Cs\���ȱ�����x|�Ñ�@����؁��O ��a���fYP����A5I`Bu!���RbX��y`C���k2��y�OqR��V_�.ս(Mћ`nhJ���Dw��RZ��F0t?�$~��k��<�񄵾�w�LG�R���G$���en�Lr�e4���0�s��O�Q$��k�/� eZ3�T�|����uo+Y�+A���jdZ���N|�y��g��xQ����Ao��C��'M��J%���=���F`FV�E��MM�ϊ�5��AVp���v1�Y63<���윝�Q����
�U��j��~��A��0 ����1�/+.:�I�����������d��[�y��-�[G�/z�ª�N+S\����k;�<_)���"�G�V~���LD����x��:�e��U G�T�����۔e"+�D4�0�R����m���d�����y�|i�,��ۉ�+b���s����\{BF�Ό�$����)��M퍁����Ǎ`��(���.��w����G�qw'��}a.4���Neս�;����R�_�5��d*z��8�`w9�A�I��T���|z��=��ދ61�g����e��\�^_N'�7�<�l�E���Ʉ���Y���W��a{�h\M篆�?��6V[�bG273�B~ʅg[�x'�)��Ql[�����P���:Gl��a�7Q�P:��վ��j�Œ��UM��m(|
үh�O�ԕJ��zoc
�_%C4�+��S�g�#%����K؏�;�uT�|
x�1������,�Z�^�Dcb���\3G��e_�̥�� �K��pp�M�**�ƽ���Q�ZVi`�9�k���]��Ό�U��/�.`V��nME]ں�����jI�8�k%��+g����E�;+�C��튈4�Z��(��ʂ��G��&w�|B	�?t��@=��gvU��B�WI��-��e�T���9�L��;ϲ�`5S`���s�t��-���b�������� ��B;A��c���DTO�ffe�l���x�0�Cx@���2��˓�3H)xDD^��K����mx,�ڏ�6P���y8mLc36��f"��i�D��t"�г�e��E�ȥ��u�j"6��ң��4o�n�ϝ�e�~c_ޔ�e��ҿ��T
諄���)��I}�|�<���Ma7@��3�����T�i8��y@��^o�0�,�$�>�xP�W�:ck�����R���"U���CM{��?���q( @�C����`�>�>7�z�)�VJ��|�z1��W�]�qw�EU�"v��\��>�V�-hM��یCd�&�:P��v��t�}����Q��UK1�R�f��|>L��	H$�$Q-EQ8��}⿠��������S�Gt��l-�A���Qz�{L¤�yr��A�t�>�5�H�=T���J!G-�T���1�$vI|�
�V��84}.`8u$����qޗN�
Ǌ�D�v-��۟��+2���4�n)#�˟�a�.�K[ܺ��o���aH��TO����G(d4ڂi��w�?^�:s���^�uӚ�ˊP^\��������~�;g|B��ȋ���;�X^���������	�2��j�z꽬Ԇ�X>nF�A�%C���h�K(���b��r�g�{�{��s�C6���I`3"O�x��5sl$��\i� };� C�ѣ�G+�|��(����g�-G<�a�ή�h}0�߫6k.�Ͼ�݌Ⴅ��b�����K������ā�     