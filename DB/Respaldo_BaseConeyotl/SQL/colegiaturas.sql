PGDMP     6    5                x           d5uhjf5jth5qko     12.3 (Ubuntu 12.3-1.pgdg16.04+1)    12.2     5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    25985320    d5uhjf5jth5qko    DATABASE     �   CREATE DATABASE d5uhjf5jth5qko WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d5uhjf5jth5qko;
                dzmfrgrrkgatqc    false            9           0    0    DATABASE d5uhjf5jth5qko    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE d5uhjf5jth5qko FROM PUBLIC;
                   dzmfrgrrkgatqc    false    3896            :           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO dzmfrgrrkgatqc;
                   postgres    false    678            �            1259    30048785    colegiaturas    TABLE     �  CREATE TABLE public.colegiaturas (
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
       public          dzmfrgrrkgatqc    false    218            ;           0    0    colegiaturas_colegiatura_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.colegiaturas_colegiatura_id_seq OWNED BY public.colegiaturas.colegiatura_id;
          public          dzmfrgrrkgatqc    false    217            �           2604    30048788    colegiaturas colegiatura_id    DEFAULT     �   ALTER TABLE ONLY public.colegiaturas ALTER COLUMN colegiatura_id SET DEFAULT nextval('public.colegiaturas_colegiatura_id_seq'::regclass);
 J   ALTER TABLE public.colegiaturas ALTER COLUMN colegiatura_id DROP DEFAULT;
       public          dzmfrgrrkgatqc    false    218    217    218            2          0    30048785    colegiaturas 
   TABLE DATA           o   COPY public.colegiaturas (colegiatura_id, estudiante_id, monto, maximo, fecha, mes, status, ciclo) FROM stdin;
    public          dzmfrgrrkgatqc    false    218   �       <           0    0    colegiaturas_colegiatura_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.colegiaturas_colegiatura_id_seq', 270, true);
          public          dzmfrgrrkgatqc    false    217            �           2606    30048793    colegiaturas colegiaturas_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.colegiaturas
    ADD CONSTRAINT colegiaturas_pkey PRIMARY KEY (colegiatura_id);
 H   ALTER TABLE ONLY public.colegiaturas DROP CONSTRAINT colegiaturas_pkey;
       public            dzmfrgrrkgatqc    false    218            �           2606    30048794    colegiaturas estudiante_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.colegiaturas
    ADD CONSTRAINT estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(estudiante_id);
 I   ALTER TABLE ONLY public.colegiaturas DROP CONSTRAINT estudiante_id_fkey;
       public          dzmfrgrrkgatqc    false    218            2   �  x���[��E����X�x��(�6(H�@�lx��������
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
VPlnQw�� 8��kԊ0Cf>#�+����k�����:��n���w�e�����g��h�"�����*��e}"4��Ld�[��>��N��_�0�4:�%��S`]7�c��F�r�;��f��_���|w�1X���#�=R�a^��k,����a^�b��ه|0�`����_��wG���mЎ0�_�_E��۹�2Y�/xM�e�BE�����޽��M�s     