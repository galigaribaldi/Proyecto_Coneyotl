PGDMP          6                x           d5uhjf5jth5qko     12.3 (Ubuntu 12.3-1.pgdg16.04+1)    12.2 	    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
                   postgres    false    678            �            1259    25997736 
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
       public         heap    dzmfrgrrkgatqc    false            -          0    25997736 
   estudiante 
   TABLE DATA           �   COPY public.estudiante (estudiante_id, curp, nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono_casa, telefono_celular, correo_electronico, passwords, dia_registro, estado, ingresos_pltaforma) FROM stdin;
    public          dzmfrgrrkgatqc    false    202   J       �           2606    25997744    estudiante estudiante_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (estudiante_id);
 D   ALTER TABLE ONLY public.estudiante DROP CONSTRAINT estudiante_pkey;
       public            dzmfrgrrkgatqc    false    202            -      x��\Kr�H�]�N���Ϯ�DB��$m�� �d?Y$���f�ǘE/�u�y� )e��U��Ֆ"HIx�?��C�aZ>KSM�Q9ӣ$�6�˹ȧq��%Y��K�����B�D9M�H��2N�/�N���鿟���zs��^|,t���4,G������a��۪̅�����q����6�ˑ(�voiN{q�s�&K1��c���Os]�B���w5pW�ք�eؖ����PZ1��yR�"*�[���6��8���kA{���/"�����2pg�����~:�뇏�ǟ?�O=�ZL��2!b�6�,�-�JZ\M�	,��b)Jz����?�kÞ���f��7�,^
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
���@�����-X�?`nZ��)��c�ZOg\��V�<�إp�/���Yn,��<_=6�,�)yʃ-K�[mׄ���,��x��px����w���l��1�?J��Q-�\P�t��TP=�.���=��j*�v���b�Co����>�1�������5����^L%��&��� �t;�Ϋ}8$�uYb��K����e ����~�T]C�=��	X�����O�)Ni�     