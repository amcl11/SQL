--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-31 16:08:37 AEST

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
-- TOC entry 216 (class 1259 OID 16699)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    dept_no character varying(5) NOT NULL,
    dept_name character varying(20) NOT NULL
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16712)
-- Name: department_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_employee (
    emp_no integer NOT NULL,
    dept_no character varying(5) NOT NULL
);


ALTER TABLE public.department_employee OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16709)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_no character varying(5) NOT NULL,
    emp_no integer NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16692)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    emp_no integer NOT NULL,
    emp_title_id character varying(10) NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    sex character varying(20) NOT NULL,
    hire_date date NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16687)
-- Name: salary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salary (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);


ALTER TABLE public.salary OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16704)
-- Name: title; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.title (
    title_id character varying(10) NOT NULL,
    title character varying(20) NOT NULL
);


ALTER TABLE public.title OWNER TO postgres;

--
-- TOC entry 3463 (class 2606 OID 16703)
-- Name: department pk_department; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT pk_department PRIMARY KEY (dept_no);


--
-- TOC entry 3461 (class 2606 OID 16698)
-- Name: employee pk_employee; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT pk_employee PRIMARY KEY (emp_no);


--
-- TOC entry 3459 (class 2606 OID 16691)
-- Name: salary pk_salary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salary
    ADD CONSTRAINT pk_salary PRIMARY KEY (emp_no);


--
-- TOC entry 3465 (class 2606 OID 16708)
-- Name: title pk_title; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title
    ADD CONSTRAINT pk_title PRIMARY KEY (title_id);


--
-- TOC entry 3469 (class 2606 OID 16735)
-- Name: department_employee fk_department_employee_dept_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_employee
    ADD CONSTRAINT fk_department_employee_dept_no FOREIGN KEY (dept_no) REFERENCES public.department(dept_no);


--
-- TOC entry 3470 (class 2606 OID 16730)
-- Name: department_employee fk_department_employee_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_employee
    ADD CONSTRAINT fk_department_employee_emp_no FOREIGN KEY (emp_no) REFERENCES public.employee(emp_no);


--
-- TOC entry 3468 (class 2606 OID 16725)
-- Name: dept_manager fk_dept_manager_dept_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES public.department(dept_no);


--
-- TOC entry 3466 (class 2606 OID 16715)
-- Name: employee fk_employee_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_emp_no FOREIGN KEY (emp_no) REFERENCES public.salary(emp_no);


--
-- TOC entry 3467 (class 2606 OID 16720)
-- Name: employee fk_employee_emp_title_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES public.title(title_id);


-- Completed on 2023-07-31 16:08:37 AEST

--
-- PostgreSQL database dump complete
--

