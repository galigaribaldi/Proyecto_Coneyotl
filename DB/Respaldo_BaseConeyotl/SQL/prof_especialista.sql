PGDMP         9                x           d5uhjf5jth5qko     12.3 (Ubuntu 12.3-1.pgdg16.04+1)    12.2 	    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    25985320    d5uhjf5jth5qko    DATABASE     �   CREATE DATABASE d5uhjf5jth5qko WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d5uhjf5jth5qko;
                dzmfrgrrkgatqc    false            4           0    0    DATABASE d5uhjf5jth5qko    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE d5uhjf5jth5qko FROM PUBLIC;
                   dzmfrgrrkgatqc    false    3891            5           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO dzmfrgrrkgatqc;
                   postgres    false    678            �            1259    25997754    profesor_especialista    TABLE     ~  CREATE TABLE public.profesor_especialista (
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
       public         heap    dzmfrgrrkgatqc    false            -          0    25997754    profesor_especialista 
   TABLE DATA           �   COPY public.profesor_especialista (profesor_id, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords, estado, grado, nombre_materia, ingresos_pltaforma) FROM stdin;
    public          dzmfrgrrkgatqc    false    204   ?       �           2606    25997759 0   profesor_especialista profesor_especialista_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.profesor_especialista
    ADD CONSTRAINT profesor_especialista_pkey PRIMARY KEY (profesor_id);
 Z   ALTER TABLE ONLY public.profesor_especialista DROP CONSTRAINT profesor_especialista_pkey;
       public            dzmfrgrrkgatqc    false    204            -   �  x����n�@����j��`L0	`��R)�+�h�+ŷ{詷�CO}�Xg��I�H�}�o�og8�Eir&/&�y^1	9�{��~���h�U� 5�`��\`�i6g��f����-@��uVN��ݼʊ��"��ER{����^dqT��\ee��LEQU�BHls��y����uW�ִ� e�7f��Kj��Z�B10'����	�ε0|��y�ų|�F�\�0M��fL	翪*�!&B�^��kaj��*��dD�*P:P
V�&�y�!U����H�2͏�ɳ�ĕP$�I��f���|�F�����Z�¬��m�E{�тt���G�6�|z���6z�����"T�h�:���7-�n�P6�����gݧ񳚗����N
�o�D+.X8� �g#��� 1.�Z�wT�����(�n�;�^f6~}h��,�8;~-A�hh8�QQ��7��LA�4�K�ĥ����ڈ�����!i�,�۝%/��k|2���p�����4<\�8Y�f!��{Y��^u;����{71:���r?�2`��/���~zo�Q�]����dvK��4U���xLS+ ��O�گ����n����	�P�欢]��Ͼ�o'�#1�0?�s/�     