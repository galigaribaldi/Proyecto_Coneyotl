PGDMP     .    9                x           d5uhjf5jth5qko     12.3 (Ubuntu 12.3-1.pgdg16.04+1)    12.2 	    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
                   postgres    false    678            �            1259    25997745    profesor_grado    TABLE     N  CREATE TABLE public.profesor_grado (
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
       public         heap    dzmfrgrrkgatqc    false            -          0    25997745    profesor_grado 
   TABLE DATA           �   COPY public.profesor_grado (profesor_id, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords, estado, grado, ingresos_pltaforma) FROM stdin;
    public          dzmfrgrrkgatqc    false    203   �
       �           2606    25997753 "   profesor_grado profesor_grado_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.profesor_grado
    ADD CONSTRAINT profesor_grado_pkey PRIMARY KEY (profesor_id);
 L   ALTER TABLE ONLY public.profesor_grado DROP CONSTRAINT profesor_grado_pkey;
       public            dzmfrgrrkgatqc    false    203            -   �  x�uS�n�@��<�����!$q�#��Q�hc.6p
�n���3�ź+Q�� Bs;�3�\p���?oqp=�5�#қ�\r!!��b�a�N׾���r�X�a���6�XquS�%���C��ڵ�����ph���X�ap#(Z�86�p}�o>0V�õ���N�j^^g��2%��iV����2�1�I��[�#̟p2�6=�@�c)��� "��?C$�G[�U&%'��2g	d-�k�����
���j\`��8t�dl��WB��_l����yHD$!M�BΙ$�</Oc�8���� ��|y�ʷd32ȖH�l"h���f<A�Lt+�G�����MdU�3�1d8���oG����� �b�( ����~�����DN�YY��U9�ʅ"�lYQr7�G�����
�����@&��g9��	��#n���ݯ���t"�$��Â�R�R���)���g�P�7�G�� ���J�"�^�H����`��4wi+���/gS��̤J�����;!�A��$�d���v��f煈����T$Ȃln%¾�J�4�;���Z��a�*$�(���Zr�s��z�>��[JG�hz�Q�3�Qʩ���mF���{���랾dH��R%�2X��b��I�\cg�qE"-��C��J#Q7��:X�c��^C=�	vv\H��(��=hK     