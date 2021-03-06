PGDMP         (            
    w            Hospital    10.10    10.10 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16393    Hospital    DATABASE     h   CREATE DATABASE "Hospital" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE "Hospital";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    13241    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16759 	   AMBULANCE    TABLE     u   CREATE TABLE public."AMBULANCE" (
    "VehicleNumber" character varying(7) NOT NULL,
    "VehicleLicenseExp" date
);
    DROP TABLE public."AMBULANCE";
       public         postgres    false    3            �            1259    16401    CASE    TABLE     �   CREATE TABLE public."CASE" (
    "CaseID" character(10) NOT NULL,
    "Date" timestamp(4) without time zone NOT NULL,
    "Description" text NOT NULL,
    "Diagnosis" text NOT NULL,
    "PatientID" character(7)
);
    DROP TABLE public."CASE";
       public         postgres    false    3            �            1259    16416 
   DEPARTMENT    TABLE     t   CREATE TABLE public."DEPARTMENT" (
    "DpID" character(3) NOT NULL,
    "DpName" character varying(20) NOT NULL
);
     DROP TABLE public."DEPARTMENT";
       public         postgres    false    3            �            1259    16564    DOCTOR    TABLE     �   CREATE TABLE public."DOCTOR" (
    "EmpID" character(7) NOT NULL,
    "Specialist" character varying(20),
    "LicenseID" character varying(10),
    "LicenseExp" date
);
    DROP TABLE public."DOCTOR";
       public         postgres    false    3            �            1259    17014    DOCTOR_OWN_CASE    TABLE     u   CREATE TABLE public."DOCTOR_OWN_CASE" (
    "DoctorID" character(7) NOT NULL,
    "CaseID" character(10) NOT NULL
);
 %   DROP TABLE public."DOCTOR_OWN_CASE";
       public         postgres    false    3            �            1259    16433    EMPLOYEE    TABLE     �  CREATE TABLE public."EMPLOYEE" (
    "EmpID" character(7) NOT NULL,
    "Fname" character varying(20) NOT NULL,
    "Lname" character varying(20) NOT NULL,
    "Nationality" character varying(20),
    "Gender" character(1),
    "Address" character varying(255),
    "Ssn" character(13),
    "Tel" character(10),
    "DpID" character(3),
    "JobType" character varying(20),
    "BirthDate" timestamp(4) with time zone
);
    DROP TABLE public."EMPLOYEE";
       public         postgres    false    3            �            1259    17060 
   EMP_ON_AMB    TABLE     �   CREATE TABLE public."EMP_ON_AMB" (
    "VehicleNumber" character varying(7) NOT NULL,
    "EmpID" character(10) NOT NULL,
    "TimeStamp" timestamp without time zone NOT NULL
);
     DROP TABLE public."EMP_ON_AMB";
       public         postgres    false    3            �            1259    17075    EMP_WITHDRAW_EQ    TABLE       CREATE TABLE public."EMP_WITHDRAW_EQ" (
    "EmpID" character(7) NOT NULL,
    "MedEqID" character(7) NOT NULL,
    "NumOfEq" integer NOT NULL,
    "TimeStamp" time without time zone NOT NULL,
    CONSTRAINT "EMP_WITHDRAW_EQ_NumOfEq_check" CHECK (("NumOfEq" >= 0))
);
 %   DROP TABLE public."EMP_WITHDRAW_EQ";
       public         postgres    false    3            �            1259    16546 	   INSURANCE    TABLE     �   CREATE TABLE public."INSURANCE" (
    "InsurID" character(7) NOT NULL,
    "InsurName" character varying(50) NOT NULL,
    "InsurCompany" character varying(30),
    "Financial" text,
    "Condition" text,
    "PatientID" character(7) NOT NULL
);
    DROP TABLE public."INSURANCE";
       public         postgres    false    3            �            1259    16696    INTERN    TABLE     n   CREATE TABLE public."INTERN" (
    "EmpID" character(7) NOT NULL,
    "StartDate" date,
    "EndDate" date
);
    DROP TABLE public."INTERN";
       public         postgres    false    3            �            1259    17045    INTERN_TRO_CASE    TABLE     u   CREATE TABLE public."INTERN_TRO_CASE" (
    "InternID" character(7) NOT NULL,
    "CaseID" character(10) NOT NULL
);
 %   DROP TABLE public."INTERN_TRO_CASE";
       public         postgres    false    3            �            1259    16510 
   IN_PATIENT    TABLE     �   CREATE TABLE public."IN_PATIENT" (
    "PatientID" character(7) NOT NULL,
    "RoomID" character(5) NOT NULL,
    "StartDate" timestamp(4) without time zone NOT NULL
);
     DROP TABLE public."IN_PATIENT";
       public         postgres    false    3            �            1259    17210    IN_PATIENT_HISTORY    TABLE     �   CREATE TABLE public."IN_PATIENT_HISTORY" (
    "PatientID" character(7) NOT NULL,
    "StartDate" time without time zone NOT NULL,
    "EndDate" time without time zone NOT NULL
);
 (   DROP TABLE public."IN_PATIENT_HISTORY";
       public         postgres    false    3            �            1259    16463    LABORATORY_ROOM    TABLE     �   CREATE TABLE public."LABORATORY_ROOM" (
    "RoomID" character(5) NOT NULL,
    "RoomName" character varying(20) NOT NULL,
    "ManagerID" character(7)
);
 %   DROP TABLE public."LABORATORY_ROOM";
       public         postgres    false    3            �            1259    16749    MEDICAL_EQUIPMENT    TABLE     E  CREATE TABLE public."MEDICAL_EQUIPMENT" (
    "MedEqID" character(7) NOT NULL,
    "MedEqName" character varying(50) NOT NULL,
    "Price" integer,
    "Amount" integer NOT NULL,
    CONSTRAINT "MEDICAL_EQUIPMENT_Amount_check" CHECK (("Amount" >= 0)),
    CONSTRAINT "MEDICAL_EQUIPMENT_Price_check" CHECK (("Price" >= 0))
);
 '   DROP TABLE public."MEDICAL_EQUIPMENT";
       public         postgres    false    3            �            1259    16744    MEDICINE_STORAGE    TABLE     �   CREATE TABLE public."MEDICINE_STORAGE" (
    "MedGroup" character varying(20) NOT NULL,
    "MedName" character varying(50) NOT NULL,
    "MedicineID" character(7) NOT NULL,
    "Amount" integer NOT NULL
);
 &   DROP TABLE public."MEDICINE_STORAGE";
       public         postgres    false    3            �            1259    16686    NURSE    TABLE     �   CREATE TABLE public."NURSE" (
    "EmpID" character(7) NOT NULL,
    "Head" boolean,
    "LicenseID" character varying(10),
    "LicenseExp" date
);
    DROP TABLE public."NURSE";
       public         postgres    false    3            �            1259    17029    NURSE_TCO_CASE    TABLE     s   CREATE TABLE public."NURSE_TCO_CASE" (
    "NurseID" character(7) NOT NULL,
    "CaseID" character(10) NOT NULL
);
 $   DROP TABLE public."NURSE_TCO_CASE";
       public         postgres    false    3            �            1259    16706    OTHER_EMPLOYEE    TABLE     z   CREATE TABLE public."OTHER_EMPLOYEE" (
    "EmpID" character(7) NOT NULL,
    "JobName" character varying(30) NOT NULL
);
 $   DROP TABLE public."OTHER_EMPLOYEE";
       public         postgres    false    3            �            1259    16453 
   OTHER_ROOM    TABLE     x   CREATE TABLE public."OTHER_ROOM" (
    "RoomID" character(5) NOT NULL,
    "RoomName" character varying(20) NOT NULL
);
     DROP TABLE public."OTHER_ROOM";
       public         postgres    false    3            �            1259    16394    PATIENT    TABLE     i  CREATE TABLE public."PATIENT" (
    "Tel" character(10) NOT NULL,
    "PatientID" character(7) NOT NULL,
    "Lname" character varying(20) NOT NULL,
    "Gender" character(1),
    "Fname" character varying(20) NOT NULL,
    "CousinTel" character(10),
    "BirthDate" date,
    "Age" integer,
    "Address" character varying(255),
    "InpatientFlag" boolean
);
    DROP TABLE public."PATIENT";
       public         postgres    false    3            �            1259    16496    PATIENT_ROOM    TABLE       CREATE TABLE public."PATIENT_ROOM" (
    "RoomID" character(5) NOT NULL,
    "RoomNO" character(5) NOT NULL,
    "MaxPatient" integer NOT NULL,
    "NumPatient" integer NOT NULL,
    CONSTRAINT "PATIENT_ROOM_check" CHECK ((("NumPatient" >= 0) AND ("NumPatient" <= "MaxPatient")))
);
 "   DROP TABLE public."PATIENT_ROOM";
       public         postgres    false    3            �            1259    16525    PAYMENT_HISTORY    TABLE     �  CREATE TABLE public."PAYMENT_HISTORY" (
    "PayID" integer NOT NULL,
    "Date" date NOT NULL,
    "Cost" integer NOT NULL,
    "Description" text,
    "PayerName" character varying(20),
    "PayerTel" character(10),
    "PatientID" character(7) NOT NULL,
    "InsurID" character(7),
    "PayeeID" character(7) NOT NULL,
    "CaseID" character(10) NOT NULL,
    CONSTRAINT "PAYMENT_HISTORY_Cost_check" CHECK (("Cost" > 0))
);
 %   DROP TABLE public."PAYMENT_HISTORY";
       public         postgres    false    3            �            1259    16716 
   PHARMACIST    TABLE     �   CREATE TABLE public."PHARMACIST" (
    "EmpID" character(7) NOT NULL,
    "LicenseID" character varying(10),
    "LicenseExp" date
);
     DROP TABLE public."PHARMACIST";
       public         postgres    false    3            �            1259    16726    PRESCRIPTION    TABLE     �   CREATE TABLE public."PRESCRIPTION" (
    "PrescriptID" character(10) NOT NULL,
    "Description" text,
    "Date" date NOT NULL,
    "CaseID" character(10) NOT NULL,
    "PharmacistID" character(7) NOT NULL
);
 "   DROP TABLE public."PRESCRIPTION";
       public         postgres    false    3            �            1259    16998    PRES_WITHDRAW_MED    TABLE       CREATE TABLE public."PRES_WITHDRAW_MED" (
    "MedicineID" character(7) NOT NULL,
    "NumOfMed" integer NOT NULL,
    "PrescriptID" character(10) NOT NULL,
    "TimeStamp" time without time zone NOT NULL,
    CONSTRAINT "PRES_WITHDRAW_MED_NumOfMed_check" CHECK (("NumOfMed" >= 0))
);
 '   DROP TABLE public."PRES_WITHDRAW_MED";
       public         postgres    false    3            �            1259    16443    ROOM    TABLE     �   CREATE TABLE public."ROOM" (
    "RoomID" character(5) NOT NULL,
    "BuildingName" character varying(20),
    "RoomType" character varying(20),
    "DpID" character(3)
);
    DROP TABLE public."ROOM";
       public         postgres    false    3            	          0    16759 	   AMBULANCE 
   TABLE DATA               K   COPY public."AMBULANCE" ("VehicleNumber", "VehicleLicenseExp") FROM stdin;
    public       postgres    false    215   !�       �          0    16401    CASE 
   TABLE DATA               [   COPY public."CASE" ("CaseID", "Date", "Description", "Diagnosis", "PatientID") FROM stdin;
    public       postgres    false    197   >�       �          0    16416 
   DEPARTMENT 
   TABLE DATA               8   COPY public."DEPARTMENT" ("DpID", "DpName") FROM stdin;
    public       postgres    false    198   ��                 0    16564    DOCTOR 
   TABLE DATA               T   COPY public."DOCTOR" ("EmpID", "Specialist", "LicenseID", "LicenseExp") FROM stdin;
    public       postgres    false    207   ��                 0    17014    DOCTOR_OWN_CASE 
   TABLE DATA               A   COPY public."DOCTOR_OWN_CASE" ("DoctorID", "CaseID") FROM stdin;
    public       postgres    false    217   ѫ       �          0    16433    EMPLOYEE 
   TABLE DATA               �   COPY public."EMPLOYEE" ("EmpID", "Fname", "Lname", "Nationality", "Gender", "Address", "Ssn", "Tel", "DpID", "JobType", "BirthDate") FROM stdin;
    public       postgres    false    199   ��                 0    17060 
   EMP_ON_AMB 
   TABLE DATA               M   COPY public."EMP_ON_AMB" ("VehicleNumber", "EmpID", "TimeStamp") FROM stdin;
    public       postgres    false    220   Ѭ                 0    17075    EMP_WITHDRAW_EQ 
   TABLE DATA               W   COPY public."EMP_WITHDRAW_EQ" ("EmpID", "MedEqID", "NumOfEq", "TimeStamp") FROM stdin;
    public       postgres    false    221   �                  0    16546 	   INSURANCE 
   TABLE DATA               t   COPY public."INSURANCE" ("InsurID", "InsurName", "InsurCompany", "Financial", "Condition", "PatientID") FROM stdin;
    public       postgres    false    206   �                 0    16696    INTERN 
   TABLE DATA               C   COPY public."INTERN" ("EmpID", "StartDate", "EndDate") FROM stdin;
    public       postgres    false    209   (�                 0    17045    INTERN_TRO_CASE 
   TABLE DATA               A   COPY public."INTERN_TRO_CASE" ("InternID", "CaseID") FROM stdin;
    public       postgres    false    219   O�       �          0    16510 
   IN_PATIENT 
   TABLE DATA               J   COPY public."IN_PATIENT" ("PatientID", "RoomID", "StartDate") FROM stdin;
    public       postgres    false    204   v�                 0    17210    IN_PATIENT_HISTORY 
   TABLE DATA               S   COPY public."IN_PATIENT_HISTORY" ("PatientID", "StartDate", "EndDate") FROM stdin;
    public       postgres    false    222   ��       �          0    16463    LABORATORY_ROOM 
   TABLE DATA               N   COPY public."LABORATORY_ROOM" ("RoomID", "RoomName", "ManagerID") FROM stdin;
    public       postgres    false    202   ��                 0    16749    MEDICAL_EQUIPMENT 
   TABLE DATA               X   COPY public."MEDICAL_EQUIPMENT" ("MedEqID", "MedEqName", "Price", "Amount") FROM stdin;
    public       postgres    false    214   ͭ                 0    16744    MEDICINE_STORAGE 
   TABLE DATA               [   COPY public."MEDICINE_STORAGE" ("MedGroup", "MedName", "MedicineID", "Amount") FROM stdin;
    public       postgres    false    213   �                 0    16686    NURSE 
   TABLE DATA               M   COPY public."NURSE" ("EmpID", "Head", "LicenseID", "LicenseExp") FROM stdin;
    public       postgres    false    208   �                 0    17029    NURSE_TCO_CASE 
   TABLE DATA               ?   COPY public."NURSE_TCO_CASE" ("NurseID", "CaseID") FROM stdin;
    public       postgres    false    218   .�                 0    16706    OTHER_EMPLOYEE 
   TABLE DATA               >   COPY public."OTHER_EMPLOYEE" ("EmpID", "JobName") FROM stdin;
    public       postgres    false    210   U�       �          0    16453 
   OTHER_ROOM 
   TABLE DATA               <   COPY public."OTHER_ROOM" ("RoomID", "RoomName") FROM stdin;
    public       postgres    false    201   y�       �          0    16394    PATIENT 
   TABLE DATA               �   COPY public."PATIENT" ("Tel", "PatientID", "Lname", "Gender", "Fname", "CousinTel", "BirthDate", "Age", "Address", "InpatientFlag") FROM stdin;
    public       postgres    false    196   ��       �          0    16496    PATIENT_ROOM 
   TABLE DATA               X   COPY public."PATIENT_ROOM" ("RoomID", "RoomNO", "MaxPatient", "NumPatient") FROM stdin;
    public       postgres    false    203   �       �          0    16525    PAYMENT_HISTORY 
   TABLE DATA               �   COPY public."PAYMENT_HISTORY" ("PayID", "Date", "Cost", "Description", "PayerName", "PayerTel", "PatientID", "InsurID", "PayeeID", "CaseID") FROM stdin;
    public       postgres    false    205   3�                 0    16716 
   PHARMACIST 
   TABLE DATA               J   COPY public."PHARMACIST" ("EmpID", "LicenseID", "LicenseExp") FROM stdin;
    public       postgres    false    211   P�                 0    16726    PRESCRIPTION 
   TABLE DATA               h   COPY public."PRESCRIPTION" ("PrescriptID", "Description", "Date", "CaseID", "PharmacistID") FROM stdin;
    public       postgres    false    212   w�       
          0    16998    PRES_WITHDRAW_MED 
   TABLE DATA               c   COPY public."PRES_WITHDRAW_MED" ("MedicineID", "NumOfMed", "PrescriptID", "TimeStamp") FROM stdin;
    public       postgres    false    216   ��       �          0    16443    ROOM 
   TABLE DATA               N   COPY public."ROOM" ("RoomID", "BuildingName", "RoomType", "DpID") FROM stdin;
    public       postgres    false    200   ��       L           2606    16763    AMBULANCE AMBULANCE_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."AMBULANCE"
    ADD CONSTRAINT "AMBULANCE_pkey" PRIMARY KEY ("VehicleNumber");
 F   ALTER TABLE ONLY public."AMBULANCE" DROP CONSTRAINT "AMBULANCE_pkey";
       public         postgres    false    215            "           2606    16971    CASE CASE_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."CASE"
    ADD CONSTRAINT "CASE_pkey" PRIMARY KEY ("CaseID");
 <   ALTER TABLE ONLY public."CASE" DROP CONSTRAINT "CASE_pkey";
       public         postgres    false    197            $           2606    16918    DEPARTMENT DEPARTMENT_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."DEPARTMENT"
    ADD CONSTRAINT "DEPARTMENT_pkey" PRIMARY KEY ("DpID");
 H   ALTER TABLE ONLY public."DEPARTMENT" DROP CONSTRAINT "DEPARTMENT_pkey";
       public         postgres    false    198            P           2606    17018 $   DOCTOR_OWN_CASE DOCTOR_OWN_CASE_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."DOCTOR_OWN_CASE"
    ADD CONSTRAINT "DOCTOR_OWN_CASE_pkey" PRIMARY KEY ("DoctorID", "CaseID");
 R   ALTER TABLE ONLY public."DOCTOR_OWN_CASE" DROP CONSTRAINT "DOCTOR_OWN_CASE_pkey";
       public         postgres    false    217    217            <           2606    16920    DOCTOR Doctor_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."DOCTOR"
    ADD CONSTRAINT "Doctor_pkey" PRIMARY KEY ("EmpID");
 @   ALTER TABLE ONLY public."DOCTOR" DROP CONSTRAINT "Doctor_pkey";
       public         postgres    false    207            &           2606    16599 !   EMPLOYEE EMPLOYEE_Fname_Lname_key 
   CONSTRAINT     l   ALTER TABLE ONLY public."EMPLOYEE"
    ADD CONSTRAINT "EMPLOYEE_Fname_Lname_key" UNIQUE ("Fname", "Lname");
 O   ALTER TABLE ONLY public."EMPLOYEE" DROP CONSTRAINT "EMPLOYEE_Fname_Lname_key";
       public         postgres    false    199    199            (           2606    16601    EMPLOYEE EMPLOYEE_Ssn_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."EMPLOYEE"
    ADD CONSTRAINT "EMPLOYEE_Ssn_key" UNIQUE ("Ssn");
 G   ALTER TABLE ONLY public."EMPLOYEE" DROP CONSTRAINT "EMPLOYEE_Ssn_key";
       public         postgres    false    199            *           2606    16922    EMPLOYEE EMPLOYEE_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."EMPLOYEE"
    ADD CONSTRAINT "EMPLOYEE_pkey" PRIMARY KEY ("EmpID");
 D   ALTER TABLE ONLY public."EMPLOYEE" DROP CONSTRAINT "EMPLOYEE_pkey";
       public         postgres    false    199            V           2606    17064    EMP_ON_AMB EMP_ON_AMB_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."EMP_ON_AMB"
    ADD CONSTRAINT "EMP_ON_AMB_pkey" PRIMARY KEY ("VehicleNumber", "EmpID");
 H   ALTER TABLE ONLY public."EMP_ON_AMB" DROP CONSTRAINT "EMP_ON_AMB_pkey";
       public         postgres    false    220    220            X           2606    17080 $   EMP_WITHDRAW_EQ EMP_WITHDRAW_EQ_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."EMP_WITHDRAW_EQ"
    ADD CONSTRAINT "EMP_WITHDRAW_EQ_pkey" PRIMARY KEY ("EmpID", "MedEqID");
 R   ALTER TABLE ONLY public."EMP_WITHDRAW_EQ" DROP CONSTRAINT "EMP_WITHDRAW_EQ_pkey";
       public         postgres    false    221    221            :           2606    16933    INSURANCE INSURANCE_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."INSURANCE"
    ADD CONSTRAINT "INSURANCE_pkey" PRIMARY KEY ("InsurID");
 F   ALTER TABLE ONLY public."INSURANCE" DROP CONSTRAINT "INSURANCE_pkey";
       public         postgres    false    206            T           2606    17049 $   INTERN_TRO_CASE INTERN_TRO_CASE_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."INTERN_TRO_CASE"
    ADD CONSTRAINT "INTERN_TRO_CASE_pkey" PRIMARY KEY ("InternID", "CaseID");
 R   ALTER TABLE ONLY public."INTERN_TRO_CASE" DROP CONSTRAINT "INTERN_TRO_CASE_pkey";
       public         postgres    false    219    219            @           2606    17280    INTERN INTERN_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."INTERN"
    ADD CONSTRAINT "INTERN_pkey" PRIMARY KEY ("EmpID");
 @   ALTER TABLE ONLY public."INTERN" DROP CONSTRAINT "INTERN_pkey";
       public         postgres    false    209            Z           2606    17214 *   IN_PATIENT_HISTORY IN_PATIENT_HISTORY_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."IN_PATIENT_HISTORY"
    ADD CONSTRAINT "IN_PATIENT_HISTORY_pkey" PRIMARY KEY ("PatientID", "StartDate");
 X   ALTER TABLE ONLY public."IN_PATIENT_HISTORY" DROP CONSTRAINT "IN_PATIENT_HISTORY_pkey";
       public         postgres    false    222    222            6           2606    16931    IN_PATIENT IN_PATIENT_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."IN_PATIENT"
    ADD CONSTRAINT "IN_PATIENT_pkey" PRIMARY KEY ("PatientID");
 H   ALTER TABLE ONLY public."IN_PATIENT" DROP CONSTRAINT "IN_PATIENT_pkey";
       public         postgres    false    204            0           2606    16944    LABORATORY_ROOM LABORATORY_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."LABORATORY_ROOM"
    ADD CONSTRAINT "LABORATORY_pkey" PRIMARY KEY ("RoomID");
 M   ALTER TABLE ONLY public."LABORATORY_ROOM" DROP CONSTRAINT "LABORATORY_pkey";
       public         postgres    false    202            J           2606    16880 (   MEDICAL_EQUIPMENT MEDICAL_EQUIPMENT_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."MEDICAL_EQUIPMENT"
    ADD CONSTRAINT "MEDICAL_EQUIPMENT_pkey" PRIMARY KEY ("MedEqID");
 V   ALTER TABLE ONLY public."MEDICAL_EQUIPMENT" DROP CONSTRAINT "MEDICAL_EQUIPMENT_pkey";
       public         postgres    false    214                       2606    16758 .   MEDICINE_STORAGE MEDICINE_STORAGE_Amount_check    CHECK CONSTRAINT     |   ALTER TABLE public."MEDICINE_STORAGE"
    ADD CONSTRAINT "MEDICINE_STORAGE_Amount_check" CHECK (("Amount" >= 0)) NOT VALID;
 W   ALTER TABLE public."MEDICINE_STORAGE" DROP CONSTRAINT "MEDICINE_STORAGE_Amount_check";
       public       postgres    false    213    213            H           2606    16874 &   MEDICINE_STORAGE MEDICINE_STORAGE_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."MEDICINE_STORAGE"
    ADD CONSTRAINT "MEDICINE_STORAGE_pkey" PRIMARY KEY ("MedicineID");
 T   ALTER TABLE ONLY public."MEDICINE_STORAGE" DROP CONSTRAINT "MEDICINE_STORAGE_pkey";
       public         postgres    false    213            R           2606    17033 "   NURSE_TCO_CASE NURSE_TCO_CASE_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public."NURSE_TCO_CASE"
    ADD CONSTRAINT "NURSE_TCO_CASE_pkey" PRIMARY KEY ("NurseID", "CaseID");
 P   ALTER TABLE ONLY public."NURSE_TCO_CASE" DROP CONSTRAINT "NURSE_TCO_CASE_pkey";
       public         postgres    false    218    218            >           2606    16790    NURSE NURSE_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."NURSE"
    ADD CONSTRAINT "NURSE_pkey" PRIMARY KEY ("EmpID");
 >   ALTER TABLE ONLY public."NURSE" DROP CONSTRAINT "NURSE_pkey";
       public         postgres    false    208            B           2606    16802 "   OTHER_EMPLOYEE OTHER_EMPLOYEE_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."OTHER_EMPLOYEE"
    ADD CONSTRAINT "OTHER_EMPLOYEE_pkey" PRIMARY KEY ("EmpID");
 P   ALTER TABLE ONLY public."OTHER_EMPLOYEE" DROP CONSTRAINT "OTHER_EMPLOYEE_pkey";
       public         postgres    false    210            .           2606    16957    OTHER_ROOM OTHER_ROOM_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."OTHER_ROOM"
    ADD CONSTRAINT "OTHER_ROOM_pkey" PRIMARY KEY ("RoomID");
 H   ALTER TABLE ONLY public."OTHER_ROOM" DROP CONSTRAINT "OTHER_ROOM_pkey";
       public         postgres    false    201                       2606    16647    PATIENT PATIENT_Fname_Lname_key 
   CONSTRAINT     j   ALTER TABLE ONLY public."PATIENT"
    ADD CONSTRAINT "PATIENT_Fname_Lname_key" UNIQUE ("Fname", "Lname");
 M   ALTER TABLE ONLY public."PATIENT" DROP CONSTRAINT "PATIENT_Fname_Lname_key";
       public         postgres    false    196    196            2           2606    16660 $   PATIENT_ROOM PATIENT_ROOM_RoomNO_key 
   CONSTRAINT     g   ALTER TABLE ONLY public."PATIENT_ROOM"
    ADD CONSTRAINT "PATIENT_ROOM_RoomNO_key" UNIQUE ("RoomNO");
 R   ALTER TABLE ONLY public."PATIENT_ROOM" DROP CONSTRAINT "PATIENT_ROOM_RoomNO_key";
       public         postgres    false    203            4           2606    16950    PATIENT_ROOM PATIENT_ROOM_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."PATIENT_ROOM"
    ADD CONSTRAINT "PATIENT_ROOM_pkey" PRIMARY KEY ("RoomID");
 L   ALTER TABLE ONLY public."PATIENT_ROOM" DROP CONSTRAINT "PATIENT_ROOM_pkey";
       public         postgres    false    203                       2606    16808    PATIENT PATIENT_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."PATIENT"
    ADD CONSTRAINT "PATIENT_pkey" PRIMARY KEY ("PatientID");
 B   ALTER TABLE ONLY public."PATIENT" DROP CONSTRAINT "PATIENT_pkey";
       public         postgres    false    196            8           2606    16530 $   PAYMENT_HISTORY PAYMENT_HISTORY_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."PAYMENT_HISTORY"
    ADD CONSTRAINT "PAYMENT_HISTORY_pkey" PRIMARY KEY ("PayID");
 R   ALTER TABLE ONLY public."PAYMENT_HISTORY" DROP CONSTRAINT "PAYMENT_HISTORY_pkey";
       public         postgres    false    205            D           2606    16963    PHARMACIST PHARMACIST_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."PHARMACIST"
    ADD CONSTRAINT "PHARMACIST_pkey" PRIMARY KEY ("EmpID");
 H   ALTER TABLE ONLY public."PHARMACIST" DROP CONSTRAINT "PHARMACIST_pkey";
       public         postgres    false    211            F           2606    16980    PRESCRIPTION PRESCRIPTION_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."PRESCRIPTION"
    ADD CONSTRAINT "PRESCRIPTION_pkey" PRIMARY KEY ("PrescriptID");
 L   ALTER TABLE ONLY public."PRESCRIPTION" DROP CONSTRAINT "PRESCRIPTION_pkey";
       public         postgres    false    212            N           2606    17003 (   PRES_WITHDRAW_MED PRES_WITHDRAW_MED_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."PRES_WITHDRAW_MED"
    ADD CONSTRAINT "PRES_WITHDRAW_MED_pkey" PRIMARY KEY ("MedicineID", "PrescriptID");
 V   ALTER TABLE ONLY public."PRES_WITHDRAW_MED" DROP CONSTRAINT "PRES_WITHDRAW_MED_pkey";
       public         postgres    false    216    216            ,           2606    16965    ROOM ROOM_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."ROOM"
    ADD CONSTRAINT "ROOM_pkey" PRIMARY KEY ("RoomID");
 <   ALTER TABLE ONLY public."ROOM" DROP CONSTRAINT "ROOM_pkey";
       public         postgres    false    200                        1259    17344    fname,lname    INDEX     O   CREATE INDEX "fname,lname" ON public."PATIENT" USING btree ("Fname", "Lname");
 !   DROP INDEX public."fname,lname";
       public         postgres    false    196    196            [           2606    17331    CASE CASE_PatientID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."CASE"
    ADD CONSTRAINT "CASE_PatientID_fkey" FOREIGN KEY ("PatientID") REFERENCES public."PATIENT"("PatientID") ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."CASE" DROP CONSTRAINT "CASE_PatientID_fkey";
       public       postgres    false    197    196    3103            i           2606    17316    DOCTOR DOCTOR_EmpID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."DOCTOR"
    ADD CONSTRAINT "DOCTOR_EmpID_fkey" FOREIGN KEY ("EmpID") REFERENCES public."EMPLOYEE"("EmpID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."DOCTOR" DROP CONSTRAINT "DOCTOR_EmpID_fkey";
       public       postgres    false    3114    207    199            s           2606    17326 +   DOCTOR_OWN_CASE DOCTOR_OWN_CASE_CaseID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."DOCTOR_OWN_CASE"
    ADD CONSTRAINT "DOCTOR_OWN_CASE_CaseID_fkey" FOREIGN KEY ("CaseID") REFERENCES public."CASE"("CaseID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Y   ALTER TABLE ONLY public."DOCTOR_OWN_CASE" DROP CONSTRAINT "DOCTOR_OWN_CASE_CaseID_fkey";
       public       postgres    false    3106    217    197            r           2606    17321 -   DOCTOR_OWN_CASE DOCTOR_OWN_CASE_DoctorID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."DOCTOR_OWN_CASE"
    ADD CONSTRAINT "DOCTOR_OWN_CASE_DoctorID_fkey" FOREIGN KEY ("DoctorID") REFERENCES public."DOCTOR"("EmpID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 [   ALTER TABLE ONLY public."DOCTOR_OWN_CASE" DROP CONSTRAINT "DOCTOR_OWN_CASE_DoctorID_fkey";
       public       postgres    false    217    3132    207            \           2606    17101    EMPLOYEE EMPLOYEE_DpID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EMPLOYEE"
    ADD CONSTRAINT "EMPLOYEE_DpID_fkey" FOREIGN KEY ("DpID") REFERENCES public."DEPARTMENT"("DpID") NOT VALID;
 I   ALTER TABLE ONLY public."EMPLOYEE" DROP CONSTRAINT "EMPLOYEE_DpID_fkey";
       public       postgres    false    3108    198    199            y           2606    17070     EMP_ON_AMB EMP_ON_AMB_EmpID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EMP_ON_AMB"
    ADD CONSTRAINT "EMP_ON_AMB_EmpID_fkey" FOREIGN KEY ("EmpID") REFERENCES public."EMPLOYEE"("EmpID");
 N   ALTER TABLE ONLY public."EMP_ON_AMB" DROP CONSTRAINT "EMP_ON_AMB_EmpID_fkey";
       public       postgres    false    3114    199    220            x           2606    17065 (   EMP_ON_AMB EMP_ON_AMB_VehicleNumber_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EMP_ON_AMB"
    ADD CONSTRAINT "EMP_ON_AMB_VehicleNumber_fkey" FOREIGN KEY ("VehicleNumber") REFERENCES public."AMBULANCE"("VehicleNumber");
 V   ALTER TABLE ONLY public."EMP_ON_AMB" DROP CONSTRAINT "EMP_ON_AMB_VehicleNumber_fkey";
       public       postgres    false    220    215    3148            z           2606    17081 *   EMP_WITHDRAW_EQ EMP_WITHDRAW_EQ_EmpID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EMP_WITHDRAW_EQ"
    ADD CONSTRAINT "EMP_WITHDRAW_EQ_EmpID_fkey" FOREIGN KEY ("EmpID") REFERENCES public."EMPLOYEE"("EmpID");
 X   ALTER TABLE ONLY public."EMP_WITHDRAW_EQ" DROP CONSTRAINT "EMP_WITHDRAW_EQ_EmpID_fkey";
       public       postgres    false    221    199    3114            {           2606    17086 ,   EMP_WITHDRAW_EQ EMP_WITHDRAW_EQ_MedEqID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EMP_WITHDRAW_EQ"
    ADD CONSTRAINT "EMP_WITHDRAW_EQ_MedEqID_fkey" FOREIGN KEY ("MedEqID") REFERENCES public."MEDICAL_EQUIPMENT"("MedEqID");
 Z   ALTER TABLE ONLY public."EMP_WITHDRAW_EQ" DROP CONSTRAINT "EMP_WITHDRAW_EQ_MedEqID_fkey";
       public       postgres    false    3146    214    221            h           2606    17106 "   INSURANCE INSURANCE_PatientID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."INSURANCE"
    ADD CONSTRAINT "INSURANCE_PatientID_fkey" FOREIGN KEY ("PatientID") REFERENCES public."PATIENT"("PatientID") NOT VALID;
 P   ALTER TABLE ONLY public."INSURANCE" DROP CONSTRAINT "INSURANCE_PatientID_fkey";
       public       postgres    false    206    3103    196            k           2606    17281    INTERN INTERN_EmpID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."INTERN"
    ADD CONSTRAINT "INTERN_EmpID_fkey" FOREIGN KEY ("EmpID") REFERENCES public."EMPLOYEE"("EmpID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."INTERN" DROP CONSTRAINT "INTERN_EmpID_fkey";
       public       postgres    false    209    199    3114            w           2606    17296 +   INTERN_TRO_CASE INTERN_TRO_CASE_CaseID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."INTERN_TRO_CASE"
    ADD CONSTRAINT "INTERN_TRO_CASE_CaseID_fkey" FOREIGN KEY ("CaseID") REFERENCES public."CASE"("CaseID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Y   ALTER TABLE ONLY public."INTERN_TRO_CASE" DROP CONSTRAINT "INTERN_TRO_CASE_CaseID_fkey";
       public       postgres    false    219    3106    197            v           2606    17291 -   INTERN_TRO_CASE INTERN_TRO_CASE_InternID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."INTERN_TRO_CASE"
    ADD CONSTRAINT "INTERN_TRO_CASE_InternID_fkey" FOREIGN KEY ("InternID") REFERENCES public."INTERN"("EmpID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 [   ALTER TABLE ONLY public."INTERN_TRO_CASE" DROP CONSTRAINT "INTERN_TRO_CASE_InternID_fkey";
       public       postgres    false    209    219    3136            |           2606    17215 4   IN_PATIENT_HISTORY IN_PATIENT_HISTORY_PatientID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."IN_PATIENT_HISTORY"
    ADD CONSTRAINT "IN_PATIENT_HISTORY_PatientID_fkey" FOREIGN KEY ("PatientID") REFERENCES public."PATIENT"("PatientID");
 b   ALTER TABLE ONLY public."IN_PATIENT_HISTORY" DROP CONSTRAINT "IN_PATIENT_HISTORY_PatientID_fkey";
       public       postgres    false    3103    222    196            b           2606    17116 $   IN_PATIENT IN_PATIENT_PatientID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."IN_PATIENT"
    ADD CONSTRAINT "IN_PATIENT_PatientID_fkey" FOREIGN KEY ("PatientID") REFERENCES public."PATIENT"("PatientID") NOT VALID;
 R   ALTER TABLE ONLY public."IN_PATIENT" DROP CONSTRAINT "IN_PATIENT_PatientID_fkey";
       public       postgres    false    3103    196    204            c           2606    17121 !   IN_PATIENT IN_PATIENT_RoomID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."IN_PATIENT"
    ADD CONSTRAINT "IN_PATIENT_RoomID_fkey" FOREIGN KEY ("RoomID") REFERENCES public."PATIENT_ROOM"("RoomID") NOT VALID;
 O   ALTER TABLE ONLY public."IN_PATIENT" DROP CONSTRAINT "IN_PATIENT_RoomID_fkey";
       public       postgres    false    204    3124    203            `           2606    17131 .   LABORATORY_ROOM LABORATORY_ROOM_ManagerID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."LABORATORY_ROOM"
    ADD CONSTRAINT "LABORATORY_ROOM_ManagerID_fkey" FOREIGN KEY ("ManagerID") REFERENCES public."EMPLOYEE"("EmpID") NOT VALID;
 \   ALTER TABLE ONLY public."LABORATORY_ROOM" DROP CONSTRAINT "LABORATORY_ROOM_ManagerID_fkey";
       public       postgres    false    3114    199    202            _           2606    17126 +   LABORATORY_ROOM LABORATORY_ROOM_RoomID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."LABORATORY_ROOM"
    ADD CONSTRAINT "LABORATORY_ROOM_RoomID_fkey" FOREIGN KEY ("RoomID") REFERENCES public."ROOM"("RoomID") NOT VALID;
 Y   ALTER TABLE ONLY public."LABORATORY_ROOM" DROP CONSTRAINT "LABORATORY_ROOM_RoomID_fkey";
       public       postgres    false    3116    200    202            j           2606    17311    NURSE NURSE_EmpID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."NURSE"
    ADD CONSTRAINT "NURSE_EmpID_fkey" FOREIGN KEY ("EmpID") REFERENCES public."EMPLOYEE"("EmpID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 D   ALTER TABLE ONLY public."NURSE" DROP CONSTRAINT "NURSE_EmpID_fkey";
       public       postgres    false    199    3114    208            u           2606    17306 )   NURSE_TCO_CASE NURSE_TCO_CASE_CaseID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."NURSE_TCO_CASE"
    ADD CONSTRAINT "NURSE_TCO_CASE_CaseID_fkey" FOREIGN KEY ("CaseID") REFERENCES public."CASE"("CaseID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 W   ALTER TABLE ONLY public."NURSE_TCO_CASE" DROP CONSTRAINT "NURSE_TCO_CASE_CaseID_fkey";
       public       postgres    false    3106    197    218            t           2606    17301 *   NURSE_TCO_CASE NURSE_TCO_CASE_NurseID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."NURSE_TCO_CASE"
    ADD CONSTRAINT "NURSE_TCO_CASE_NurseID_fkey" FOREIGN KEY ("NurseID") REFERENCES public."NURSE"("EmpID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."NURSE_TCO_CASE" DROP CONSTRAINT "NURSE_TCO_CASE_NurseID_fkey";
       public       postgres    false    218    3134    208            l           2606    17252 (   OTHER_EMPLOYEE OTHER_EMPLOYEE_EmpID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."OTHER_EMPLOYEE"
    ADD CONSTRAINT "OTHER_EMPLOYEE_EmpID_fkey" FOREIGN KEY ("EmpID") REFERENCES public."EMPLOYEE"("EmpID") ON DELETE CASCADE NOT VALID;
 V   ALTER TABLE ONLY public."OTHER_EMPLOYEE" DROP CONSTRAINT "OTHER_EMPLOYEE_EmpID_fkey";
       public       postgres    false    210    3114    199            ^           2606    17146 !   OTHER_ROOM OTHER_ROOM_RoomID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."OTHER_ROOM"
    ADD CONSTRAINT "OTHER_ROOM_RoomID_fkey" FOREIGN KEY ("RoomID") REFERENCES public."ROOM"("RoomID") NOT VALID;
 O   ALTER TABLE ONLY public."OTHER_ROOM" DROP CONSTRAINT "OTHER_ROOM_RoomID_fkey";
       public       postgres    false    3116    200    201            a           2606    17151 %   PATIENT_ROOM PATIENT_ROOM_RoomID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PATIENT_ROOM"
    ADD CONSTRAINT "PATIENT_ROOM_RoomID_fkey" FOREIGN KEY ("RoomID") REFERENCES public."ROOM"("RoomID") NOT VALID;
 S   ALTER TABLE ONLY public."PATIENT_ROOM" DROP CONSTRAINT "PATIENT_ROOM_RoomID_fkey";
       public       postgres    false    3116    200    203            g           2606    17181 +   PAYMENT_HISTORY PAYMENT_HISTORY_CaseID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PAYMENT_HISTORY"
    ADD CONSTRAINT "PAYMENT_HISTORY_CaseID_fkey" FOREIGN KEY ("CaseID") REFERENCES public."CASE"("CaseID") NOT VALID;
 Y   ALTER TABLE ONLY public."PAYMENT_HISTORY" DROP CONSTRAINT "PAYMENT_HISTORY_CaseID_fkey";
       public       postgres    false    197    205    3106            e           2606    17171 ,   PAYMENT_HISTORY PAYMENT_HISTORY_InsurID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PAYMENT_HISTORY"
    ADD CONSTRAINT "PAYMENT_HISTORY_InsurID_fkey" FOREIGN KEY ("InsurID") REFERENCES public."INSURANCE"("InsurID") NOT VALID;
 Z   ALTER TABLE ONLY public."PAYMENT_HISTORY" DROP CONSTRAINT "PAYMENT_HISTORY_InsurID_fkey";
       public       postgres    false    206    3130    205            d           2606    17166 .   PAYMENT_HISTORY PAYMENT_HISTORY_PatientID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PAYMENT_HISTORY"
    ADD CONSTRAINT "PAYMENT_HISTORY_PatientID_fkey" FOREIGN KEY ("PatientID") REFERENCES public."PATIENT"("PatientID") NOT VALID;
 \   ALTER TABLE ONLY public."PAYMENT_HISTORY" DROP CONSTRAINT "PAYMENT_HISTORY_PatientID_fkey";
       public       postgres    false    3103    196    205            f           2606    17176 ,   PAYMENT_HISTORY PAYMENT_HISTORY_PayeeID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PAYMENT_HISTORY"
    ADD CONSTRAINT "PAYMENT_HISTORY_PayeeID_fkey" FOREIGN KEY ("PayeeID") REFERENCES public."EMPLOYEE"("EmpID") NOT VALID;
 Z   ALTER TABLE ONLY public."PAYMENT_HISTORY" DROP CONSTRAINT "PAYMENT_HISTORY_PayeeID_fkey";
       public       postgres    false    199    3114    205            m           2606    17186     PHARMACIST PHARMACIST_EmpID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PHARMACIST"
    ADD CONSTRAINT "PHARMACIST_EmpID_fkey" FOREIGN KEY ("EmpID") REFERENCES public."EMPLOYEE"("EmpID") NOT VALID;
 N   ALTER TABLE ONLY public."PHARMACIST" DROP CONSTRAINT "PHARMACIST_EmpID_fkey";
       public       postgres    false    3114    211    199            n           2606    17191 %   PRESCRIPTION PRESCRIPTION_CaseID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PRESCRIPTION"
    ADD CONSTRAINT "PRESCRIPTION_CaseID_fkey" FOREIGN KEY ("CaseID") REFERENCES public."CASE"("CaseID") NOT VALID;
 S   ALTER TABLE ONLY public."PRESCRIPTION" DROP CONSTRAINT "PRESCRIPTION_CaseID_fkey";
       public       postgres    false    212    197    3106            o           2606    17196 +   PRESCRIPTION PRESCRIPTION_PharmacistID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PRESCRIPTION"
    ADD CONSTRAINT "PRESCRIPTION_PharmacistID_fkey" FOREIGN KEY ("PharmacistID") REFERENCES public."PHARMACIST"("EmpID") NOT VALID;
 Y   ALTER TABLE ONLY public."PRESCRIPTION" DROP CONSTRAINT "PRESCRIPTION_PharmacistID_fkey";
       public       postgres    false    3140    212    211            p           2606    17004 3   PRES_WITHDRAW_MED PRES_WITHDRAW_MED_MedicineID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PRES_WITHDRAW_MED"
    ADD CONSTRAINT "PRES_WITHDRAW_MED_MedicineID_fkey" FOREIGN KEY ("MedicineID") REFERENCES public."MEDICINE_STORAGE"("MedicineID");
 a   ALTER TABLE ONLY public."PRES_WITHDRAW_MED" DROP CONSTRAINT "PRES_WITHDRAW_MED_MedicineID_fkey";
       public       postgres    false    3144    216    213            q           2606    17009 4   PRES_WITHDRAW_MED PRES_WITHDRAW_MED_PrescriptID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PRES_WITHDRAW_MED"
    ADD CONSTRAINT "PRES_WITHDRAW_MED_PrescriptID_fkey" FOREIGN KEY ("PrescriptID") REFERENCES public."PRESCRIPTION"("PrescriptID");
 b   ALTER TABLE ONLY public."PRES_WITHDRAW_MED" DROP CONSTRAINT "PRES_WITHDRAW_MED_PrescriptID_fkey";
       public       postgres    false    212    216    3142            ]           2606    17201    ROOM ROOM_DpID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ROOM"
    ADD CONSTRAINT "ROOM_DpID_fkey" FOREIGN KEY ("DpID") REFERENCES public."DEPARTMENT"("DpID") NOT VALID;
 A   ALTER TABLE ONLY public."ROOM" DROP CONSTRAINT "ROOM_DpID_fkey";
       public       postgres    false    200    198    3108            	      x������ � �      �   ?   x�30�CN# �50�52R02�"Δ�0��Ⴉ60®�81�3�8%1��ň+F��� .`      �      x������ � �            x�30 C�?����� 2V            x�30 CN0�2@2����� �-4      �   �   x�30 c�;ւ1�/'�����������ũ �1~��y%�Ey�F@�k`�kd�```F��\`�L9SR�(b����V��X����Y\��@C��f?ر���@Vǃ�����	�� 	�ِ��\�_��t#����X�`�
�[9��nȾ044B�#���8a�+L !� F�����eL� ��l-            x������ � �            x������ � �             x������ � �            x�30 c�? ����� $�l            x�30 cN0����� 5
�      �      x������ � �            x������ � �      �      x������ � �            x������ � �            x������ � �            x�30 #�?����� 2f            x�30 #N0����� 4��            x�30 ��=... �t      �      x������ � �      �   p   x�]̱	�0���2E��b�8�N�at
k���s�7��"B^w��g[�Mh�>c�5B6�	Y!��!�H2�q��l��8�j��)L�����t]	��lj����J)u�T?�      �      x������ � �      �      x������ � �            x�30 S�? ����� %n            x������ � �      
      x������ � �      �      x������ � �     