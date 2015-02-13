--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: base_area; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE base_area (
    id character varying(10) NOT NULL,
    pid character varying(10),
    name character varying(100) NOT NULL,
    code character varying(20),
    zone_type smallint,
    sort_num smallint
);


ALTER TABLE public.base_area OWNER TO postgres;

--
-- Name: TABLE base_area; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE base_area IS '省份地市';


--
-- Name: COLUMN base_area.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_area.id IS 'id';


--
-- Name: COLUMN base_area.pid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_area.pid IS '父级';


--
-- Name: COLUMN base_area.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_area.name IS '名称';


--
-- Name: COLUMN base_area.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_area.code IS '代码';


--
-- Name: COLUMN base_area.zone_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_area.zone_type IS '地区类别';


--
-- Name: COLUMN base_area.sort_num; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_area.sort_num IS '顺序号';


--
-- Name: base_sncreater; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE base_sncreater (
    id character varying(10) NOT NULL,
    name character varying(20) NOT NULL,
    code character varying(20) NOT NULL,
    qz character varying(10) NOT NULL,
    qyrq smallint DEFAULT 1,
    rqgs character varying(20) DEFAULT 'yyyyMMdd'::character varying,
    dqxh integer,
    sfmrgx smallint DEFAULT 1,
    ws smallint DEFAULT 6 NOT NULL,
    company_id character varying(10) NOT NULL,
    udate character varying(10)
);


ALTER TABLE public.base_sncreater OWNER TO postgres;

--
-- Name: TABLE base_sncreater; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE base_sncreater IS '编号生成设置';


--
-- Name: COLUMN base_sncreater.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_sncreater.id IS 'id';


--
-- Name: COLUMN base_sncreater.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_sncreater.name IS '名称';


--
-- Name: COLUMN base_sncreater.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_sncreater.code IS '编码';


--
-- Name: COLUMN base_sncreater.qz; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_sncreater.qz IS '前缀';


--
-- Name: COLUMN base_sncreater.qyrq; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_sncreater.qyrq IS '是否启用日期';


--
-- Name: COLUMN base_sncreater.rqgs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_sncreater.rqgs IS '日期格式';


--
-- Name: COLUMN base_sncreater.dqxh; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_sncreater.dqxh IS '当前序号';


--
-- Name: COLUMN base_sncreater.sfmrgx; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_sncreater.sfmrgx IS '更新周期';


--
-- Name: COLUMN base_sncreater.ws; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_sncreater.ws IS '序号位数';


--
-- Name: COLUMN base_sncreater.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_sncreater.company_id IS '企业id';


--
-- Name: COLUMN base_sncreater.udate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN base_sncreater.udate IS '更新日期';


--
-- Name: crm_business; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_business (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    customer_id character varying(10) NOT NULL,
    head_id character varying(10),
    name character varying(50) NOT NULL,
    origin character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    estimate_price numeric(10,2) DEFAULT 0 NOT NULL,
    gain_rate integer NOT NULL,
    due_date character varying(10),
    status character varying(10) NOT NULL,
    nextstep character varying(100),
    nextstep_date character varying(10),
    nextstep_time character varying(10),
    contacts_id character varying(10),
    contract_address character varying(500),
    is_end integer DEFAULT 0 NOT NULL,
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    updater_id character varying(10),
    update_datetime character varying(20),
    is_deleted smallint NOT NULL,
    delete_id character varying(10),
    delete_datetime character varying(20)
);


ALTER TABLE public.crm_business OWNER TO postgres;

--
-- Name: TABLE crm_business; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_business IS '商机';


--
-- Name: COLUMN crm_business.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.id IS 'id';


--
-- Name: COLUMN crm_business.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.company_id IS 'c企业id';


--
-- Name: COLUMN crm_business.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.customer_id IS '客户id';


--
-- Name: COLUMN crm_business.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.head_id IS '负责人';


--
-- Name: COLUMN crm_business.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.name IS '主题';


--
-- Name: COLUMN crm_business.origin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.origin IS '来源';


--
-- Name: COLUMN crm_business.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.type IS '商机类别';


--
-- Name: COLUMN crm_business.estimate_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.estimate_price IS '预计价格';


--
-- Name: COLUMN crm_business.gain_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.gain_rate IS '赢单率(百分比)';


--
-- Name: COLUMN crm_business.due_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.due_date IS '预计成交日期';


--
-- Name: COLUMN crm_business.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.status IS '商机状态';


--
-- Name: COLUMN crm_business.nextstep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.nextstep IS '下一步';


--
-- Name: COLUMN crm_business.nextstep_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.nextstep_date IS '下一步日期';


--
-- Name: COLUMN crm_business.nextstep_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.nextstep_time IS '下一步时间';


--
-- Name: COLUMN crm_business.contacts_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.contacts_id IS '联系人';


--
-- Name: COLUMN crm_business.contract_address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.contract_address IS '联系地址';


--
-- Name: COLUMN crm_business.is_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.is_end IS '结束';


--
-- Name: COLUMN crm_business.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.creater_id IS 'c创建人';


--
-- Name: COLUMN crm_business.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.create_datetime IS 'c创建时间';


--
-- Name: COLUMN crm_business.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.updater_id IS 'u修改人id';


--
-- Name: COLUMN crm_business.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.update_datetime IS 'u修改时间';


--
-- Name: COLUMN crm_business.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.is_deleted IS 'd是否删除';


--
-- Name: COLUMN crm_business.delete_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.delete_id IS 'd删除人';


--
-- Name: COLUMN crm_business.delete_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business.delete_datetime IS 'd删除时间';


--
-- Name: crm_business_data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_business_data (
    id character varying(10) NOT NULL,
    remark text,
    data text
);


ALTER TABLE public.crm_business_data OWNER TO postgres;

--
-- Name: TABLE crm_business_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_business_data IS '商机数据';


--
-- Name: COLUMN crm_business_data.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business_data.id IS 'id';


--
-- Name: COLUMN crm_business_data.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business_data.remark IS 'r备注';


--
-- Name: COLUMN crm_business_data.data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_business_data.data IS 'd自定义数据';


--
-- Name: crm_campaigns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_campaigns (
    id character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    head_id character varying(10) NOT NULL,
    product_id character varying(10),
    type character varying(30),
    end_date character varying(10) NOT NULL,
    hearer character varying(50),
    hearer_size smallint,
    initiator_id character varying(10),
    send_count smallint,
    cost_budget numeric(10,2),
    expect_reaction character varying(20),
    expect_income numeric(10,2),
    exp_sale_count smallint,
    exp_rec_count smallint,
    exp_rate_return double precision,
    fact_cost numeric(10,2),
    fact_sale_count smallint,
    fact_rec_count smallint,
    fact_rate_return double precision,
    remark text,
    company_id character varying(10) NOT NULL,
    creater_id character varying(10),
    create_datetime character varying(20),
    updater_id character varying(10),
    update_datetime character varying(20)
);


ALTER TABLE public.crm_campaigns OWNER TO postgres;

--
-- Name: TABLE crm_campaigns; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_campaigns IS '营销活动';


--
-- Name: COLUMN crm_campaigns.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.id IS 'id';


--
-- Name: COLUMN crm_campaigns.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.name IS '主题';


--
-- Name: COLUMN crm_campaigns.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.status IS '营销活动状态';


--
-- Name: COLUMN crm_campaigns.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.head_id IS 'h负责人';


--
-- Name: COLUMN crm_campaigns.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.product_id IS '产品';


--
-- Name: COLUMN crm_campaigns.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.type IS '营销活动类型';


--
-- Name: COLUMN crm_campaigns.end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.end_date IS '预计结束日期';


--
-- Name: COLUMN crm_campaigns.hearer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.hearer IS '听众';


--
-- Name: COLUMN crm_campaigns.hearer_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.hearer_size IS '目标大小';


--
-- Name: COLUMN crm_campaigns.initiator_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.initiator_id IS '发起人';


--
-- Name: COLUMN crm_campaigns.send_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.send_count IS '发送数量';


--
-- Name: COLUMN crm_campaigns.cost_budget; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.cost_budget IS '成本预算';


--
-- Name: COLUMN crm_campaigns.expect_reaction; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.expect_reaction IS '预期反应';


--
-- Name: COLUMN crm_campaigns.expect_income; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.expect_income IS '预期收入';


--
-- Name: COLUMN crm_campaigns.exp_sale_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.exp_sale_count IS '预期销售量';


--
-- Name: COLUMN crm_campaigns.exp_rec_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.exp_rec_count IS '预期反应数量';


--
-- Name: COLUMN crm_campaigns.exp_rate_return; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.exp_rate_return IS '预期回报率';


--
-- Name: COLUMN crm_campaigns.fact_cost; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.fact_cost IS '实际成本';


--
-- Name: COLUMN crm_campaigns.fact_sale_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.fact_sale_count IS '实际销售量';


--
-- Name: COLUMN crm_campaigns.fact_rec_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.fact_rec_count IS '实际反应数量';


--
-- Name: COLUMN crm_campaigns.fact_rate_return; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.fact_rate_return IS '实际回报率';


--
-- Name: COLUMN crm_campaigns.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.remark IS 'r备注';


--
-- Name: COLUMN crm_campaigns.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.company_id IS 'c企业id';


--
-- Name: COLUMN crm_campaigns.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.creater_id IS 'c创建人';


--
-- Name: COLUMN crm_campaigns.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.create_datetime IS 'c创建时间';


--
-- Name: COLUMN crm_campaigns.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.updater_id IS '修改人id';


--
-- Name: COLUMN crm_campaigns.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_campaigns.update_datetime IS '修改时间';


--
-- Name: crm_contact_record; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_contact_record (
    id character varying(10) NOT NULL,
    subject character varying(100) NOT NULL,
    concat_datetime character varying(20) NOT NULL,
    customer_id character varying(10) NOT NULL,
    contacts_id character varying(10) NOT NULL,
    concat_type character varying(20) NOT NULL,
    sale_stage character varying(20) NOT NULL,
    cust_status character varying(20) NOT NULL,
    business_id character varying(10),
    content text NOT NULL,
    create_datetime character varying(20) NOT NULL,
    creater_id character varying(10) NOT NULL,
    next_datetime character varying(20),
    company_id character varying(10) NOT NULL
);


ALTER TABLE public.crm_contact_record OWNER TO postgres;

--
-- Name: TABLE crm_contact_record; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_contact_record IS '联系记录';


--
-- Name: COLUMN crm_contact_record.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.id IS 'id';


--
-- Name: COLUMN crm_contact_record.subject; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.subject IS '主题';


--
-- Name: COLUMN crm_contact_record.concat_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.concat_datetime IS '联系时间';


--
-- Name: COLUMN crm_contact_record.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.customer_id IS '客户ID';


--
-- Name: COLUMN crm_contact_record.contacts_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.contacts_id IS '联系人ID';


--
-- Name: COLUMN crm_contact_record.concat_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.concat_type IS '联系类别';


--
-- Name: COLUMN crm_contact_record.sale_stage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.sale_stage IS '销售阶段';


--
-- Name: COLUMN crm_contact_record.cust_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.cust_status IS '客户状态';


--
-- Name: COLUMN crm_contact_record.business_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.business_id IS '商机id';


--
-- Name: COLUMN crm_contact_record.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.content IS '内容';


--
-- Name: COLUMN crm_contact_record.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.create_datetime IS '创建时间';


--
-- Name: COLUMN crm_contact_record.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.creater_id IS '创建人id';


--
-- Name: COLUMN crm_contact_record.next_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.next_datetime IS '下次联系时间';


--
-- Name: COLUMN crm_contact_record.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contact_record.company_id IS '企业id';


--
-- Name: crm_contacts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_contacts (
    id character varying(10) NOT NULL,
    customer_id character varying(10),
    supplier_id character varying(10),
    creater_id character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    post character varying(20),
    department character varying(20),
    sex integer NOT NULL,
    saltname character varying(20),
    telephone character varying(20),
    email character varying(50),
    qq character varying(20),
    address character varying(50),
    zip_code character varying(20),
    description character varying(100),
    create_datetime character varying(20) NOT NULL,
    update_datetime character varying(20),
    mobile character varying(50),
    company_id character varying(10) NOT NULL,
    is_main smallint DEFAULT 0 NOT NULL,
    updater_id character varying(10),
    idcard character varying(50),
    type smallint
);


ALTER TABLE public.crm_contacts OWNER TO postgres;

--
-- Name: TABLE crm_contacts; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_contacts IS '联系人';


--
-- Name: COLUMN crm_contacts.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.id IS 'id';


--
-- Name: COLUMN crm_contacts.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.customer_id IS '客户id';


--
-- Name: COLUMN crm_contacts.supplier_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.supplier_id IS '供应商id';


--
-- Name: COLUMN crm_contacts.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.creater_id IS '创建者id';


--
-- Name: COLUMN crm_contacts.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.name IS '姓名';


--
-- Name: COLUMN crm_contacts.post; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.post IS '岗位';


--
-- Name: COLUMN crm_contacts.department; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.department IS '部门';


--
-- Name: COLUMN crm_contacts.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.sex IS '联系人性别';


--
-- Name: COLUMN crm_contacts.saltname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.saltname IS '称呼';


--
-- Name: COLUMN crm_contacts.telephone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.telephone IS '电话';


--
-- Name: COLUMN crm_contacts.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.email IS '邮箱';


--
-- Name: COLUMN crm_contacts.qq; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.qq IS 'qq';


--
-- Name: COLUMN crm_contacts.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.address IS '联系地址';


--
-- Name: COLUMN crm_contacts.zip_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.zip_code IS '邮编';


--
-- Name: COLUMN crm_contacts.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.description IS '备注';


--
-- Name: COLUMN crm_contacts.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.create_datetime IS '创建时间';


--
-- Name: COLUMN crm_contacts.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.update_datetime IS '修改时间';


--
-- Name: COLUMN crm_contacts.mobile; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.mobile IS '手机';


--
-- Name: COLUMN crm_contacts.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.company_id IS '企业id';


--
-- Name: COLUMN crm_contacts.is_main; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.is_main IS '首要联系人';


--
-- Name: COLUMN crm_contacts.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.updater_id IS '修改人id';


--
-- Name: COLUMN crm_contacts.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts.type IS '0 供应商
1 企业客户
2 个人客户';


--
-- Name: crm_contacts_data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_contacts_data (
    id character varying(10) NOT NULL,
    remark text NOT NULL
);


ALTER TABLE public.crm_contacts_data OWNER TO postgres;

--
-- Name: TABLE crm_contacts_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_contacts_data IS '联系人数据';


--
-- Name: COLUMN crm_contacts_data.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts_data.id IS 'id';


--
-- Name: COLUMN crm_contacts_data.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_contacts_data.remark IS 'r备注';


--
-- Name: crm_cust_rating; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_cust_rating (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    name character varying(20) NOT NULL,
    integral_start smallint DEFAULT 0 NOT NULL,
    integral_end smallint DEFAULT 0 NOT NULL,
    rate_star smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.crm_cust_rating OWNER TO postgres;

--
-- Name: TABLE crm_cust_rating; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_cust_rating IS '客户会员级别';


--
-- Name: COLUMN crm_cust_rating.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_cust_rating.id IS 'id';


--
-- Name: COLUMN crm_cust_rating.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_cust_rating.company_id IS 'c企业id';


--
-- Name: COLUMN crm_cust_rating.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_cust_rating.name IS '名称';


--
-- Name: COLUMN crm_cust_rating.integral_start; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_cust_rating.integral_start IS '起始积分';


--
-- Name: COLUMN crm_cust_rating.integral_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_cust_rating.integral_end IS '截止积分';


--
-- Name: COLUMN crm_cust_rating.rate_star; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_cust_rating.rate_star IS '星星数';


--
-- Name: crm_customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_customer (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    head_id character varying(10),
    creater_id character varying(10) NOT NULL,
    contacts_id character varying(10),
    name character varying(333) NOT NULL,
    origin character varying(10),
    address character varying(100),
    zip_code integer,
    industry character varying(10),
    ownership character varying(10),
    rating character varying(10),
    creator_id character varying(10),
    create_datetime character varying(20) NOT NULL,
    updater_id character varying(10),
    update_datetime character varying(20),
    is_deleted smallint,
    deleter_id character varying(10),
    delete_datetime character varying(20),
    province character varying(10) NOT NULL,
    province_name character varying(50),
    city character varying(10) NOT NULL,
    city_name character varying(50),
    area character varying(10),
    area_name character varying(50),
    email character varying(50),
    fax character varying(30),
    telephone character varying(50),
    companyfc_id character varying(10),
    sn character varying(50) NOT NULL,
    mobile character varying(50),
    year_turnover character varying(10),
    ent_cate character varying(10),
    integral smallint DEFAULT 0,
    staff_size character varying(10),
    ent_stage character varying(10),
    status smallint,
    member_card character varying(50),
    amt numeric(10,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.crm_customer OWNER TO postgres;

--
-- Name: TABLE crm_customer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_customer IS '客户';


--
-- Name: COLUMN crm_customer.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.id IS 'id';


--
-- Name: COLUMN crm_customer.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.company_id IS 'c企业id';


--
-- Name: COLUMN crm_customer.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.type IS '类别';


--
-- Name: COLUMN crm_customer.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.head_id IS '负责人';


--
-- Name: COLUMN crm_customer.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.creater_id IS '创建者id';


--
-- Name: COLUMN crm_customer.contacts_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.contacts_id IS '首要联系人';


--
-- Name: COLUMN crm_customer.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.name IS '名称';


--
-- Name: COLUMN crm_customer.origin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.origin IS '来源';


--
-- Name: COLUMN crm_customer.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.address IS '地址';


--
-- Name: COLUMN crm_customer.zip_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.zip_code IS '邮编';


--
-- Name: COLUMN crm_customer.industry; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.industry IS '行业';


--
-- Name: COLUMN crm_customer.ownership; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.ownership IS '与公司关系';


--
-- Name: COLUMN crm_customer.rating; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.rating IS '等级';


--
-- Name: COLUMN crm_customer.creator_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.creator_id IS 'c创建人';


--
-- Name: COLUMN crm_customer.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.create_datetime IS '创建时间';


--
-- Name: COLUMN crm_customer.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.updater_id IS 'u修改人id';


--
-- Name: COLUMN crm_customer.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.update_datetime IS 'u修改时间';


--
-- Name: COLUMN crm_customer.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.is_deleted IS 'd是否删除';


--
-- Name: COLUMN crm_customer.deleter_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.deleter_id IS 'd删除人';


--
-- Name: COLUMN crm_customer.delete_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.delete_datetime IS 'd删除时间';


--
-- Name: COLUMN crm_customer.province; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.province IS '省份';


--
-- Name: COLUMN crm_customer.province_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.province_name IS '省份名称';


--
-- Name: COLUMN crm_customer.city; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.city IS '市级';


--
-- Name: COLUMN crm_customer.city_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.city_name IS '市级名称';


--
-- Name: COLUMN crm_customer.area; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.area IS '县级';


--
-- Name: COLUMN crm_customer.area_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.area_name IS '县级名称';


--
-- Name: COLUMN crm_customer.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.email IS '邮箱';


--
-- Name: COLUMN crm_customer.fax; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.fax IS '传真';


--
-- Name: COLUMN crm_customer.telephone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.telephone IS '电话';


--
-- Name: COLUMN crm_customer.companyfc_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.companyfc_id IS '对应云平台管理客户';


--
-- Name: COLUMN crm_customer.sn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.sn IS '编号';


--
-- Name: COLUMN crm_customer.mobile; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.mobile IS '手机';


--
-- Name: COLUMN crm_customer.year_turnover; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.year_turnover IS '年营业额';


--
-- Name: COLUMN crm_customer.ent_cate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.ent_cate IS '企业类别';


--
-- Name: COLUMN crm_customer.integral; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.integral IS '积分';


--
-- Name: COLUMN crm_customer.staff_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.staff_size IS '人员规模';


--
-- Name: COLUMN crm_customer.ent_stage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.ent_stage IS '企业阶段';


--
-- Name: COLUMN crm_customer.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.status IS '状态
0：
1：放入客户池
';


--
-- Name: COLUMN crm_customer.member_card; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.member_card IS '会员卡号';


--
-- Name: COLUMN crm_customer.amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer.amt IS '金额';


--
-- Name: crm_customer_cares; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_customer_cares (
    id character varying(10) NOT NULL,
    subject character varying(100) NOT NULL,
    care_datetime character varying(20) NOT NULL,
    contacts_id character varying(10) NOT NULL,
    customer_id character varying(10) NOT NULL,
    head_id character varying(10) NOT NULL,
    care_type character varying(20) NOT NULL,
    content text NOT NULL,
    description character varying(1000) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    update_datetime character varying(20),
    updater_id character varying(10),
    company_id character varying(10) NOT NULL,
    creater_id character varying(10) NOT NULL
);


ALTER TABLE public.crm_customer_cares OWNER TO postgres;

--
-- Name: TABLE crm_customer_cares; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_customer_cares IS '客户关怀';


--
-- Name: COLUMN crm_customer_cares.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.id IS 'id';


--
-- Name: COLUMN crm_customer_cares.subject; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.subject IS '主题';


--
-- Name: COLUMN crm_customer_cares.care_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.care_datetime IS '关怀时间';


--
-- Name: COLUMN crm_customer_cares.contacts_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.contacts_id IS 'contacts_id';


--
-- Name: COLUMN crm_customer_cares.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.customer_id IS 'customer_id';


--
-- Name: COLUMN crm_customer_cares.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.head_id IS '负责人id';


--
-- Name: COLUMN crm_customer_cares.care_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.care_type IS '关怀类别';


--
-- Name: COLUMN crm_customer_cares.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.content IS '内容';


--
-- Name: COLUMN crm_customer_cares.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.description IS '描述';


--
-- Name: COLUMN crm_customer_cares.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.create_datetime IS '创建时间';


--
-- Name: COLUMN crm_customer_cares.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.update_datetime IS 'u修改时间';


--
-- Name: COLUMN crm_customer_cares.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.updater_id IS 'u修改人id';


--
-- Name: COLUMN crm_customer_cares.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.company_id IS '企业id';


--
-- Name: COLUMN crm_customer_cares.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_cares.creater_id IS '创建人';


--
-- Name: crm_customer_data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_customer_data (
    id character varying(10) NOT NULL,
    remark text,
    data text
);


ALTER TABLE public.crm_customer_data OWNER TO postgres;

--
-- Name: TABLE crm_customer_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_customer_data IS '客户数据';


--
-- Name: COLUMN crm_customer_data.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_data.id IS 'id';


--
-- Name: COLUMN crm_customer_data.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_data.remark IS 'r备注';


--
-- Name: COLUMN crm_customer_data.data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_data.data IS 'd自定义数据';


--
-- Name: crm_customer_record; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_customer_record (
    id character varying(10) NOT NULL,
    customer_id character varying(10) NOT NULL,
    user_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    type integer NOT NULL
);


ALTER TABLE public.crm_customer_record OWNER TO postgres;

--
-- Name: TABLE crm_customer_record; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_customer_record IS '客户流转记录';


--
-- Name: COLUMN crm_customer_record.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_record.id IS 'id';


--
-- Name: COLUMN crm_customer_record.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_record.customer_id IS '客户';


--
-- Name: COLUMN crm_customer_record.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_record.user_id IS '用户';


--
-- Name: COLUMN crm_customer_record.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_record.create_datetime IS 'c创建时间';


--
-- Name: COLUMN crm_customer_record.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_customer_record.type IS '类别';


--
-- Name: crm_email_template; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_email_template (
    id character varying(10) NOT NULL,
    subject character varying(200) NOT NULL,
    title character varying(100) NOT NULL,
    content character varying(500) NOT NULL,
    order_id integer NOT NULL,
    creater_id character varying(10) NOT NULL,
    updater_id character varying(10)
);


ALTER TABLE public.crm_email_template OWNER TO postgres;

--
-- Name: TABLE crm_email_template; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_email_template IS '邮件模板';


--
-- Name: COLUMN crm_email_template.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_email_template.id IS 'id';


--
-- Name: COLUMN crm_email_template.subject; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_email_template.subject IS '主题';


--
-- Name: COLUMN crm_email_template.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_email_template.title IS 'title';


--
-- Name: COLUMN crm_email_template.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_email_template.content IS '内容';


--
-- Name: COLUMN crm_email_template.order_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_email_template.order_id IS '顺序';


--
-- Name: COLUMN crm_email_template.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_email_template.creater_id IS '创建人id';


--
-- Name: COLUMN crm_email_template.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_email_template.updater_id IS 'u修改人id';


--
-- Name: crm_integral_history; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_integral_history (
    id character varying(10) NOT NULL,
    customer_id character varying(10) NOT NULL,
    gain smallint DEFAULT 0,
    deplete smallint,
    remark character varying(100),
    create_datetime character varying(20),
    order_id character varying(10) NOT NULL
);


ALTER TABLE public.crm_integral_history OWNER TO postgres;

--
-- Name: TABLE crm_integral_history; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_integral_history IS '会员积分记录';


--
-- Name: COLUMN crm_integral_history.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_integral_history.id IS 'id';


--
-- Name: COLUMN crm_integral_history.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_integral_history.customer_id IS '客户id';


--
-- Name: COLUMN crm_integral_history.gain; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_integral_history.gain IS '获取积分';


--
-- Name: COLUMN crm_integral_history.deplete; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_integral_history.deplete IS '消耗积分';


--
-- Name: COLUMN crm_integral_history.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_integral_history.remark IS '备注';


--
-- Name: COLUMN crm_integral_history.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_integral_history.create_datetime IS 'c创建时间';


--
-- Name: COLUMN crm_integral_history.order_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_integral_history.order_id IS '订单id';


--
-- Name: crm_leads; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_leads (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    position_name character varying(20),
    contacts_name character varying(255),
    saltname character varying(255),
    mobile character varying(255),
    email character varying(50),
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    update_datetime character varying(20),
    is_deleted integer NOT NULL,
    delete_id character varying(10),
    delete_datetime character varying(20),
    is_transformed integer NOT NULL,
    transform_id character varying(10),
    contacts_id character varying(10),
    customer_id character varying(10),
    business_id character varying(10),
    nextstep character varying(50),
    nextstep_date character varying(10),
    address character varying(500),
    customer_name character varying(50),
    telephone character varying(50),
    updater_id character varying(10)
);


ALTER TABLE public.crm_leads OWNER TO postgres;

--
-- Name: TABLE crm_leads; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_leads IS '线索';


--
-- Name: COLUMN crm_leads.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.id IS 'id';


--
-- Name: COLUMN crm_leads.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.company_id IS 'c企业id';


--
-- Name: COLUMN crm_leads.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.name IS '主题';


--
-- Name: COLUMN crm_leads.position_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.position_name IS '职位';


--
-- Name: COLUMN crm_leads.contacts_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.contacts_name IS '联系人姓名';


--
-- Name: COLUMN crm_leads.saltname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.saltname IS 'saltname';


--
-- Name: COLUMN crm_leads.mobile; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.mobile IS 'mobile';


--
-- Name: COLUMN crm_leads.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.email IS '电子邮箱';


--
-- Name: COLUMN crm_leads.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.creater_id IS 'c创建人';


--
-- Name: COLUMN crm_leads.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.create_datetime IS '创建时间';


--
-- Name: COLUMN crm_leads.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.update_datetime IS '修改时间';


--
-- Name: COLUMN crm_leads.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.is_deleted IS '是否删除';


--
-- Name: COLUMN crm_leads.delete_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.delete_id IS 'd删除人';


--
-- Name: COLUMN crm_leads.delete_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.delete_datetime IS 'd删除时间';


--
-- Name: COLUMN crm_leads.is_transformed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.is_transformed IS '是否转换';


--
-- Name: COLUMN crm_leads.transform_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.transform_id IS '转换者';


--
-- Name: COLUMN crm_leads.contacts_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.contacts_id IS '转换成联系人';


--
-- Name: COLUMN crm_leads.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.customer_id IS '转换成的客户';


--
-- Name: COLUMN crm_leads.business_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.business_id IS '转换成的商机';


--
-- Name: COLUMN crm_leads.nextstep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.nextstep IS '下一次联系';


--
-- Name: COLUMN crm_leads.nextstep_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.nextstep_date IS '下一步日期';


--
-- Name: COLUMN crm_leads.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.address IS '地址';


--
-- Name: COLUMN crm_leads.customer_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.customer_name IS '客户名称';


--
-- Name: COLUMN crm_leads.telephone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.telephone IS '电话';


--
-- Name: COLUMN crm_leads.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads.updater_id IS '修改人';


--
-- Name: crm_leads_data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_leads_data (
    id character varying(10) NOT NULL,
    remark text,
    data text
);


ALTER TABLE public.crm_leads_data OWNER TO postgres;

--
-- Name: TABLE crm_leads_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_leads_data IS '线索数据';


--
-- Name: COLUMN crm_leads_data.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads_data.id IS 'id';


--
-- Name: COLUMN crm_leads_data.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads_data.remark IS 'r备注';


--
-- Name: COLUMN crm_leads_data.data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_leads_data.data IS 'd自定义数据';


--
-- Name: crm_recharge_record; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_recharge_record (
    id character varying(10) NOT NULL,
    amt numeric(10,2) DEFAULT 0 NOT NULL,
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    customer_id character varying(10) NOT NULL
);


ALTER TABLE public.crm_recharge_record OWNER TO postgres;

--
-- Name: TABLE crm_recharge_record; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_recharge_record IS '充值记录';


--
-- Name: COLUMN crm_recharge_record.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_recharge_record.id IS 'id';


--
-- Name: COLUMN crm_recharge_record.amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_recharge_record.amt IS '金额';


--
-- Name: COLUMN crm_recharge_record.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_recharge_record.creater_id IS '创建人id';


--
-- Name: COLUMN crm_recharge_record.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_recharge_record.create_datetime IS 'c创建时间';


--
-- Name: COLUMN crm_recharge_record.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_recharge_record.customer_id IS '客户id';


--
-- Name: crm_sms_template; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE crm_sms_template (
    id character varying(10) NOT NULL,
    subject character varying(200) NOT NULL,
    content character varying(500) NOT NULL,
    order_id integer NOT NULL,
    creater_id character varying(10) NOT NULL,
    updater_id character varying(10)
);


ALTER TABLE public.crm_sms_template OWNER TO postgres;

--
-- Name: TABLE crm_sms_template; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE crm_sms_template IS '短信模板';


--
-- Name: COLUMN crm_sms_template.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_sms_template.id IS 'id';


--
-- Name: COLUMN crm_sms_template.subject; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_sms_template.subject IS '主题';


--
-- Name: COLUMN crm_sms_template.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_sms_template.content IS '内容';


--
-- Name: COLUMN crm_sms_template.order_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_sms_template.order_id IS '顺序';


--
-- Name: COLUMN crm_sms_template.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_sms_template.creater_id IS '创建人id';


--
-- Name: COLUMN crm_sms_template.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN crm_sms_template.updater_id IS 'u修改人id';


--
-- Name: em_mechanism; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE em_mechanism (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    content text NOT NULL,
    start_date character varying(10) NOT NULL,
    end_date character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    creater_id character varying(10) NOT NULL,
    status integer NOT NULL,
    type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.em_mechanism OWNER TO postgres;

--
-- Name: TABLE em_mechanism; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE em_mechanism IS '管理机制';


--
-- Name: COLUMN em_mechanism.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_mechanism.id IS 'id';


--
-- Name: COLUMN em_mechanism.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_mechanism.company_id IS '企业id';


--
-- Name: COLUMN em_mechanism.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_mechanism.name IS '名称';


--
-- Name: COLUMN em_mechanism.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_mechanism.content IS '内容';


--
-- Name: COLUMN em_mechanism.start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_mechanism.start_date IS '开始日期';


--
-- Name: COLUMN em_mechanism.end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_mechanism.end_date IS '结束日期';


--
-- Name: COLUMN em_mechanism.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_mechanism.create_datetime IS '创建时间';


--
-- Name: COLUMN em_mechanism.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_mechanism.creater_id IS '创建人';


--
-- Name: COLUMN em_mechanism.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_mechanism.status IS '状态';


--
-- Name: COLUMN em_mechanism.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_mechanism.type IS '类别';


--
-- Name: em_salegoal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE em_salegoal (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    creater_id character varying(10) NOT NULL,
    user_id character varying(10),
    team_id character varying(10),
    department_id character varying(10),
    name character varying(50),
    status integer DEFAULT 1 NOT NULL,
    year character varying(4) NOT NULL,
    y numeric(10,2) DEFAULT 0 NOT NULL,
    q1 numeric(10,2) DEFAULT 0 NOT NULL,
    q2 numeric(10,2) DEFAULT 0 NOT NULL,
    q3 numeric(10,2) DEFAULT 0 NOT NULL,
    q4 numeric(10,2) DEFAULT 0 NOT NULL,
    m1 numeric(10,2) DEFAULT 0 NOT NULL,
    m2 numeric(10,2) DEFAULT 0 NOT NULL,
    m3 numeric(10,2) DEFAULT 0 NOT NULL,
    m4 numeric(10,2) DEFAULT 0 NOT NULL,
    m5 numeric(10,2) DEFAULT 0 NOT NULL,
    m6 numeric(10,2) DEFAULT 0 NOT NULL,
    m7 numeric(10,2) DEFAULT 0 NOT NULL,
    m8 numeric(10,2) NOT NULL,
    m9 numeric(10,2) DEFAULT 0 NOT NULL,
    m10 numeric(10,2) DEFAULT 0 NOT NULL,
    m11 numeric(10,2) DEFAULT 0 NOT NULL,
    m12 numeric(10,2) DEFAULT 0 NOT NULL,
    mv1 numeric(10,2) DEFAULT 0 NOT NULL,
    mv2 numeric(10,2) DEFAULT 0 NOT NULL,
    mv3 numeric(10,2) DEFAULT 0 NOT NULL,
    mv4 numeric(10,2) DEFAULT 0 NOT NULL,
    mv5 numeric(10,2) DEFAULT 0 NOT NULL,
    mv6 numeric(10,2) DEFAULT 0 NOT NULL,
    mv7 numeric(10,2) DEFAULT 0 NOT NULL,
    mv8 numeric(10,2) DEFAULT 0 NOT NULL,
    mv9 numeric(10,2) DEFAULT 0 NOT NULL,
    mv10 numeric(10,2) DEFAULT 0 NOT NULL,
    mv11 numeric(10,2) DEFAULT 0 NOT NULL,
    mv12 numeric(10,2) DEFAULT 0 NOT NULL,
    qv1 numeric(10,2) DEFAULT 0,
    qv2 numeric(10,2) DEFAULT 0,
    qv3 numeric(10,2) DEFAULT 0,
    qv4 numeric(10,2) DEFAULT 0,
    yv numeric(10,2) DEFAULT 0
);


ALTER TABLE public.em_salegoal OWNER TO postgres;

--
-- Name: TABLE em_salegoal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE em_salegoal IS '销售目标';


--
-- Name: COLUMN em_salegoal.y; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_salegoal.y IS '年目标值';


--
-- Name: em_team; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE em_team (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    head_id character varying(10) NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100),
    status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.em_team OWNER TO postgres;

--
-- Name: TABLE em_team; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE em_team IS '团队';


--
-- Name: COLUMN em_team.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_team.id IS 'id';


--
-- Name: COLUMN em_team.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_team.company_id IS '企业ID';


--
-- Name: COLUMN em_team.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_team.head_id IS '负责人';


--
-- Name: COLUMN em_team.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_team.name IS '名称';


--
-- Name: COLUMN em_team.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_team.description IS '备注';


--
-- Name: COLUMN em_team.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_team.status IS '状态';


--
-- Name: em_team_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE em_team_user (
    team_id character varying(10) NOT NULL,
    user_id character varying(10) NOT NULL
);


ALTER TABLE public.em_team_user OWNER TO postgres;

--
-- Name: TABLE em_team_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE em_team_user IS '团队成员组成';


--
-- Name: COLUMN em_team_user.team_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_team_user.team_id IS '团队id';


--
-- Name: COLUMN em_team_user.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN em_team_user.user_id IS '用户id';


--
-- Name: fa_account; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fa_account (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    name character varying(20) NOT NULL,
    account character varying(30) NOT NULL,
    bankname character varying(20),
    amt numeric(16,2) DEFAULT 0,
    yh smallint DEFAULT 1,
    status smallint DEFAULT 1 NOT NULL,
    khmc character varying(50)
);


ALTER TABLE public.fa_account OWNER TO postgres;

--
-- Name: TABLE fa_account; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE fa_account IS '账户设置';


--
-- Name: COLUMN fa_account.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account.id IS 'id';


--
-- Name: COLUMN fa_account.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account.company_id IS 'c企业id';


--
-- Name: COLUMN fa_account.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account.name IS '账户名称';


--
-- Name: COLUMN fa_account.account; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account.account IS '账号';


--
-- Name: COLUMN fa_account.bankname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account.bankname IS '开户银行名称';


--
-- Name: COLUMN fa_account.amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account.amt IS '当前金额';


--
-- Name: COLUMN fa_account.yh; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account.yh IS '是否是银行账户';


--
-- Name: COLUMN fa_account.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account.status IS '状态';


--
-- Name: COLUMN fa_account.khmc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account.khmc IS '开户名称';


--
-- Name: fa_account_detail; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fa_account_detail (
    id character varying(10) NOT NULL,
    amt_in numeric(10,2) DEFAULT 0,
    amt_out numeric(10,2),
    remark character varying(100),
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    account_id character varying(10) NOT NULL,
    balance numeric(10,2) DEFAULT 0 NOT NULL,
    ordersn character varying(50),
    relation_id character varying(10)
);


ALTER TABLE public.fa_account_detail OWNER TO postgres;

--
-- Name: TABLE fa_account_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE fa_account_detail IS '账号交易明细';


--
-- Name: COLUMN fa_account_detail.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account_detail.id IS 'id';


--
-- Name: COLUMN fa_account_detail.amt_in; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account_detail.amt_in IS '转入金额';


--
-- Name: COLUMN fa_account_detail.amt_out; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account_detail.amt_out IS '转出金额';


--
-- Name: COLUMN fa_account_detail.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account_detail.remark IS '备注';


--
-- Name: COLUMN fa_account_detail.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account_detail.creater_id IS '创建者id';


--
-- Name: COLUMN fa_account_detail.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account_detail.create_datetime IS 'c创建时间';


--
-- Name: COLUMN fa_account_detail.account_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account_detail.account_id IS '账号id';


--
-- Name: COLUMN fa_account_detail.balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account_detail.balance IS '余额';


--
-- Name: COLUMN fa_account_detail.ordersn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account_detail.ordersn IS '订单号，或相关连的单据号';


--
-- Name: COLUMN fa_account_detail.relation_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_account_detail.relation_id IS '关联id';


--
-- Name: fa_invoice; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fa_invoice (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    order_id character varying(10),
    order_billsn character varying(50),
    kpnr character varying(50) NOT NULL,
    head_id character varying(10),
    type smallint DEFAULT 0 NOT NULL,
    fpsn character varying(50),
    amt numeric(10,2) NOT NULL,
    kprq character varying(10) NOT NULL,
    remark character varying(100),
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    pjlx smallint
);


ALTER TABLE public.fa_invoice OWNER TO postgres;

--
-- Name: TABLE fa_invoice; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE fa_invoice IS '票据';


--
-- Name: COLUMN fa_invoice.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.id IS 'id';


--
-- Name: COLUMN fa_invoice.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.company_id IS '企业id';


--
-- Name: COLUMN fa_invoice.order_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.order_id IS '订单ID';


--
-- Name: COLUMN fa_invoice.order_billsn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.order_billsn IS '订单编号';


--
-- Name: COLUMN fa_invoice.kpnr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.kpnr IS '开票内容';


--
-- Name: COLUMN fa_invoice.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.head_id IS '负责人';


--
-- Name: COLUMN fa_invoice.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.type IS '类型';


--
-- Name: COLUMN fa_invoice.fpsn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.fpsn IS '发票号码';


--
-- Name: COLUMN fa_invoice.amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.amt IS '金额';


--
-- Name: COLUMN fa_invoice.kprq; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.kprq IS '开票日期';


--
-- Name: COLUMN fa_invoice.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.remark IS '备注';


--
-- Name: COLUMN fa_invoice.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.creater_id IS '创建人id';


--
-- Name: COLUMN fa_invoice.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.create_datetime IS '创建时间';


--
-- Name: COLUMN fa_invoice.pjlx; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_invoice.pjlx IS '票据类型';


--
-- Name: fa_pay_receiv_ables; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fa_pay_receiv_ables (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    type smallint DEFAULT 0 NOT NULL,
    customer_id character varying(10) NOT NULL,
    order_id character varying(10),
    name character varying(500),
    amt numeric(10,2) NOT NULL,
    head_id character varying(10) NOT NULL,
    description text,
    creater_id character varying(10) NOT NULL,
    pay_datetime character varying(20),
    create_datetime character varying(20) NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    update_datetime character varying(20),
    is_deleted smallint DEFAULT 0 NOT NULL,
    deleter_id character varying(10),
    delete_datetime character varying(20),
    pay_amt numeric(10,2) DEFAULT 0 NOT NULL,
    qc smallint DEFAULT 0 NOT NULL,
    qc_date character varying(10),
    is_transfer smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.fa_pay_receiv_ables OWNER TO postgres;

--
-- Name: TABLE fa_pay_receiv_ables; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE fa_pay_receiv_ables IS '应付应收';


--
-- Name: COLUMN fa_pay_receiv_ables.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.id IS 'id';


--
-- Name: COLUMN fa_pay_receiv_ables.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.company_id IS '企业id';


--
-- Name: COLUMN fa_pay_receiv_ables.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.type IS '类别';


--
-- Name: COLUMN fa_pay_receiv_ables.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.customer_id IS '客户id';


--
-- Name: COLUMN fa_pay_receiv_ables.order_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.order_id IS '合同/退货单id';


--
-- Name: COLUMN fa_pay_receiv_ables.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.name IS '应付款名';


--
-- Name: COLUMN fa_pay_receiv_ables.amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.amt IS '金额';


--
-- Name: COLUMN fa_pay_receiv_ables.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.head_id IS '负责人id';


--
-- Name: COLUMN fa_pay_receiv_ables.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.description IS '描述';


--
-- Name: COLUMN fa_pay_receiv_ables.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.creater_id IS '创建人id';


--
-- Name: COLUMN fa_pay_receiv_ables.pay_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.pay_datetime IS '付款时间';


--
-- Name: COLUMN fa_pay_receiv_ables.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.create_datetime IS '创建时间';


--
-- Name: COLUMN fa_pay_receiv_ables.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.status IS '状态';


--
-- Name: COLUMN fa_pay_receiv_ables.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.update_datetime IS '修改时间';


--
-- Name: COLUMN fa_pay_receiv_ables.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.is_deleted IS 'd是否删除';


--
-- Name: COLUMN fa_pay_receiv_ables.deleter_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.deleter_id IS 'd删除人';


--
-- Name: COLUMN fa_pay_receiv_ables.delete_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.delete_datetime IS 'd删除时间';


--
-- Name: COLUMN fa_pay_receiv_ables.qc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.qc IS '期初余额
0
1:是期初余额';


--
-- Name: COLUMN fa_pay_receiv_ables.qc_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.qc_date IS '期初日期';


--
-- Name: COLUMN fa_pay_receiv_ables.is_transfer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_ables.is_transfer IS '报价单换成订单';


--
-- Name: fa_pay_receiv_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fa_pay_receiv_order (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    name character varying(500),
    amt numeric(10,2) NOT NULL,
    payables_id character varying(10),
    description text,
    pay_datetime character varying(20),
    head_id character varying(10),
    status integer DEFAULT 0 NOT NULL,
    audit_datetime character varying(20),
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    subject_id character varying(10),
    account_id character varying(10),
    billsn character varying,
    type smallint,
    updater_id character varying(10),
    update_datetime character varying(20),
    deleter_id character varying(10),
    is_deleted smallint DEFAULT 0 NOT NULL,
    delete_datetime character varying(20),
    customer_id character varying(10),
    ables_name character varying(50),
    is_end smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.fa_pay_receiv_order OWNER TO postgres;

--
-- Name: TABLE fa_pay_receiv_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE fa_pay_receiv_order IS '付款收款单';


--
-- Name: COLUMN fa_pay_receiv_order.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.id IS 'id';


--
-- Name: COLUMN fa_pay_receiv_order.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.company_id IS '企业id';


--
-- Name: COLUMN fa_pay_receiv_order.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.name IS '付款单主题';


--
-- Name: COLUMN fa_pay_receiv_order.amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.amt IS '金额';


--
-- Name: COLUMN fa_pay_receiv_order.payables_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.payables_id IS '应付id';


--
-- Name: COLUMN fa_pay_receiv_order.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.description IS '描述';


--
-- Name: COLUMN fa_pay_receiv_order.pay_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.pay_datetime IS '付款时间';


--
-- Name: COLUMN fa_pay_receiv_order.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.head_id IS '负责人';


--
-- Name: COLUMN fa_pay_receiv_order.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.status IS '状态';


--
-- Name: COLUMN fa_pay_receiv_order.audit_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.audit_datetime IS '审核时间';


--
-- Name: COLUMN fa_pay_receiv_order.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.creater_id IS '创建者id';


--
-- Name: COLUMN fa_pay_receiv_order.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.create_datetime IS '创建时间';


--
-- Name: COLUMN fa_pay_receiv_order.subject_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.subject_id IS '财务科目';


--
-- Name: COLUMN fa_pay_receiv_order.account_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.account_id IS '账户id';


--
-- Name: COLUMN fa_pay_receiv_order.billsn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.billsn IS '支付单号';


--
-- Name: COLUMN fa_pay_receiv_order.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.type IS '类别
0:付款
1:收款';


--
-- Name: COLUMN fa_pay_receiv_order.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.updater_id IS '修改人id';


--
-- Name: COLUMN fa_pay_receiv_order.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.update_datetime IS '修改时间';


--
-- Name: COLUMN fa_pay_receiv_order.deleter_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.deleter_id IS '删除人id';


--
-- Name: COLUMN fa_pay_receiv_order.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.is_deleted IS '删除标识';


--
-- Name: COLUMN fa_pay_receiv_order.delete_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.delete_datetime IS '删除时间';


--
-- Name: COLUMN fa_pay_receiv_order.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.customer_id IS '客户id';


--
-- Name: COLUMN fa_pay_receiv_order.ables_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.ables_name IS '应收应付主题';


--
-- Name: COLUMN fa_pay_receiv_order.is_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_pay_receiv_order.is_end IS '是否已经结算结束';


--
-- Name: fa_subject; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fa_subject (
    id character varying(10) NOT NULL,
    parent_id character varying(10),
    company_id character varying(10) NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    category integer NOT NULL,
    level integer DEFAULT 1 NOT NULL,
    direction smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.fa_subject OWNER TO postgres;

--
-- Name: TABLE fa_subject; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE fa_subject IS '财务科目';


--
-- Name: COLUMN fa_subject.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_subject.id IS 'id';


--
-- Name: COLUMN fa_subject.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_subject.parent_id IS '父级';


--
-- Name: COLUMN fa_subject.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_subject.company_id IS 'c企业id';


--
-- Name: COLUMN fa_subject.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_subject.code IS '代码';


--
-- Name: COLUMN fa_subject.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_subject.name IS '名称';


--
-- Name: COLUMN fa_subject.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_subject.type IS '类别';


--
-- Name: COLUMN fa_subject.category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_subject.category IS '科目类别';


--
-- Name: COLUMN fa_subject.level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_subject.level IS '级别';


--
-- Name: COLUMN fa_subject.direction; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fa_subject.direction IS '余额方向';


--
-- Name: hr_assessment_kpi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hr_assessment_kpi (
    id character varying(10) NOT NULL,
    model_id character varying(10) NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.hr_assessment_kpi OWNER TO postgres;

--
-- Name: TABLE hr_assessment_kpi; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE hr_assessment_kpi IS '考核指标';


--
-- Name: COLUMN hr_assessment_kpi.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_assessment_kpi.id IS 'id';


--
-- Name: COLUMN hr_assessment_kpi.model_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_assessment_kpi.model_id IS '模板id';


--
-- Name: COLUMN hr_assessment_kpi.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_assessment_kpi.name IS '名称';


--
-- Name: hr_assessment_model; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hr_assessment_model (
    id character varying(10) NOT NULL,
    name character varying(20) NOT NULL,
    content text,
    postion_id character varying(10) NOT NULL
);


ALTER TABLE public.hr_assessment_model OWNER TO postgres;

--
-- Name: TABLE hr_assessment_model; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE hr_assessment_model IS '考核模板';


--
-- Name: COLUMN hr_assessment_model.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_assessment_model.id IS 'id';


--
-- Name: COLUMN hr_assessment_model.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_assessment_model.name IS '名称';


--
-- Name: COLUMN hr_assessment_model.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_assessment_model.content IS '内容';


--
-- Name: COLUMN hr_assessment_model.postion_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_assessment_model.postion_id IS '岗位id';


--
-- Name: hr_employee; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hr_employee (
    id character varying(10) NOT NULL
);


ALTER TABLE public.hr_employee OWNER TO postgres;

--
-- Name: TABLE hr_employee; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE hr_employee IS '员工';


--
-- Name: COLUMN hr_employee.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_employee.id IS 'id';


--
-- Name: hr_pact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hr_pact (
    id character varying(10) NOT NULL,
    employee_id character varying(10) NOT NULL
);


ALTER TABLE public.hr_pact OWNER TO postgres;

--
-- Name: TABLE hr_pact; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE hr_pact IS '人事合同';


--
-- Name: COLUMN hr_pact.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_pact.id IS 'id';


--
-- Name: COLUMN hr_pact.employee_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_pact.employee_id IS '员工';


--
-- Name: hr_salary; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hr_salary (
    id character varying(10) NOT NULL,
    employee_id character varying(10) NOT NULL
);


ALTER TABLE public.hr_salary OWNER TO postgres;

--
-- Name: TABLE hr_salary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE hr_salary IS '薪资';


--
-- Name: COLUMN hr_salary.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_salary.id IS 'id';


--
-- Name: COLUMN hr_salary.employee_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN hr_salary.employee_id IS '员工id';


--
-- Name: id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_seq
    START WITH 238329
    INCREMENT BY 1
    MINVALUE 238329
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq OWNER TO postgres;

--
-- Name: oa_comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oa_comment (
    id character varying(10) NOT NULL,
    creator_role_id character varying(10) NOT NULL,
    relation_id character varying(50) NOT NULL,
    content character varying(1000) NOT NULL,
    create_datetime character varying(20) NOT NULL
);


ALTER TABLE public.oa_comment OWNER TO postgres;

--
-- Name: TABLE oa_comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE oa_comment IS '评论';


--
-- Name: COLUMN oa_comment.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_comment.id IS 'id';


--
-- Name: COLUMN oa_comment.creator_role_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_comment.creator_role_id IS '评论人';


--
-- Name: COLUMN oa_comment.relation_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_comment.relation_id IS 'r关联ID';


--
-- Name: COLUMN oa_comment.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_comment.content IS '评论内容';


--
-- Name: COLUMN oa_comment.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_comment.create_datetime IS 'c创建时间';


--
-- Name: oa_dream_board; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oa_dream_board (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    user_id character varying(10) NOT NULL,
    content character varying(500) NOT NULL,
    create_datetime character varying(20) NOT NULL
);


ALTER TABLE public.oa_dream_board OWNER TO postgres;

--
-- Name: TABLE oa_dream_board; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE oa_dream_board IS '梦想板';


--
-- Name: COLUMN oa_dream_board.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_dream_board.id IS 'id';


--
-- Name: COLUMN oa_dream_board.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_dream_board.company_id IS '企业id';


--
-- Name: COLUMN oa_dream_board.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_dream_board.user_id IS '用户';


--
-- Name: COLUMN oa_dream_board.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_dream_board.content IS '内容';


--
-- Name: COLUMN oa_dream_board.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_dream_board.create_datetime IS '创建时间';


--
-- Name: oa_file; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oa_file (
    id character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    creater_id character varying(10) NOT NULL,
    file_path character varying(200) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    fsize integer DEFAULT 0 NOT NULL,
    save_path character varying(50) NOT NULL,
    relation_id character varying(50) NOT NULL
);


ALTER TABLE public.oa_file OWNER TO postgres;

--
-- Name: TABLE oa_file; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE oa_file IS '文件';


--
-- Name: COLUMN oa_file.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_file.id IS 'id';


--
-- Name: COLUMN oa_file.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_file.name IS '附件名';


--
-- Name: COLUMN oa_file.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_file.creater_id IS '创建者id';


--
-- Name: COLUMN oa_file.file_path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_file.file_path IS '文件路径';


--
-- Name: COLUMN oa_file.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_file.create_datetime IS 'c创建时间';


--
-- Name: COLUMN oa_file.fsize; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_file.fsize IS '文件大小';


--
-- Name: COLUMN oa_file.save_path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_file.save_path IS '存放路径';


--
-- Name: COLUMN oa_file.relation_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_file.relation_id IS 'r关联ID';


--
-- Name: oa_knowledge; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oa_knowledge (
    id character varying(10) NOT NULL,
    user_id character varying(10) NOT NULL,
    category_id character varying(10) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    create_datetime character varying(20) NOT NULL,
    update_datetime character varying(20) NOT NULL,
    hits integer NOT NULL,
    color character varying(50) NOT NULL
);


ALTER TABLE public.oa_knowledge OWNER TO postgres;

--
-- Name: TABLE oa_knowledge; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE oa_knowledge IS '知识';


--
-- Name: COLUMN oa_knowledge.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_knowledge.id IS 'id';


--
-- Name: COLUMN oa_knowledge.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_knowledge.user_id IS '发表人id';


--
-- Name: COLUMN oa_knowledge.category_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_knowledge.category_id IS '类别id';


--
-- Name: COLUMN oa_knowledge.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_knowledge.title IS '标题';


--
-- Name: COLUMN oa_knowledge.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_knowledge.content IS '内容';


--
-- Name: COLUMN oa_knowledge.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_knowledge.create_datetime IS '创建时间';


--
-- Name: COLUMN oa_knowledge.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_knowledge.update_datetime IS 'u修改时间';


--
-- Name: COLUMN oa_knowledge.hits; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_knowledge.hits IS '点击次数';


--
-- Name: COLUMN oa_knowledge.color; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_knowledge.color IS 'color';


--
-- Name: oa_message; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oa_message (
    id character varying(10) NOT NULL,
    to_user_id character varying(10) NOT NULL,
    from_user_id character varying(10) NOT NULL,
    content text NOT NULL,
    send_datetime character varying(20) NOT NULL,
    is_read integer DEFAULT 0 NOT NULL,
    typ integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oa_message OWNER TO postgres;

--
-- Name: TABLE oa_message; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE oa_message IS '消息';


--
-- Name: COLUMN oa_message.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_message.id IS 'id';


--
-- Name: COLUMN oa_message.to_user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_message.to_user_id IS '接收人';


--
-- Name: COLUMN oa_message.from_user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_message.from_user_id IS '发送人';


--
-- Name: COLUMN oa_message.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_message.content IS '内容';


--
-- Name: COLUMN oa_message.send_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_message.send_datetime IS '发送日期';


--
-- Name: COLUMN oa_message.is_read; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_message.is_read IS '阅读状态';


--
-- Name: COLUMN oa_message.typ; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_message.typ IS '类别';


--
-- Name: oa_notice; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oa_notice (
    id character varying(10) NOT NULL,
    user_id character varying(10) NOT NULL,
    category_id character varying(10) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    create_datetime character varying(20) NOT NULL,
    update_datetime character varying(20) NOT NULL,
    status integer NOT NULL,
    isshow integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oa_notice OWNER TO postgres;

--
-- Name: TABLE oa_notice; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE oa_notice IS '企业资讯';


--
-- Name: COLUMN oa_notice.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_notice.id IS 'id';


--
-- Name: COLUMN oa_notice.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_notice.user_id IS '发表人id';


--
-- Name: COLUMN oa_notice.category_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_notice.category_id IS '栏目id';


--
-- Name: COLUMN oa_notice.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_notice.title IS '标题';


--
-- Name: COLUMN oa_notice.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_notice.content IS '内容';


--
-- Name: COLUMN oa_notice.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_notice.create_datetime IS '创建时间';


--
-- Name: COLUMN oa_notice.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_notice.update_datetime IS 'u修改时间';


--
-- Name: COLUMN oa_notice.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_notice.status IS '是否发布';


--
-- Name: COLUMN oa_notice.isshow; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_notice.isshow IS '是否公开';


--
-- Name: oa_task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oa_task (
    id character varying(10) NOT NULL,
    owner_id character varying(10) NOT NULL,
    subject character varying(100) NOT NULL,
    due_datetime character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    priority character varying(10) NOT NULL,
    send_email integer DEFAULT 0 NOT NULL,
    description text NOT NULL,
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    isclose integer NOT NULL,
    is_deleted smallint NOT NULL
);


ALTER TABLE public.oa_task OWNER TO postgres;

--
-- Name: TABLE oa_task; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE oa_task IS '任务';


--
-- Name: COLUMN oa_task.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.id IS 'id';


--
-- Name: COLUMN oa_task.owner_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.owner_id IS '任务所有者id';


--
-- Name: COLUMN oa_task.subject; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.subject IS '任务主题';


--
-- Name: COLUMN oa_task.due_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.due_datetime IS '任务结束时间';


--
-- Name: COLUMN oa_task.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.status IS '任务状态';


--
-- Name: COLUMN oa_task.priority; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.priority IS '优先级';


--
-- Name: COLUMN oa_task.send_email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.send_email IS '发送通知';


--
-- Name: COLUMN oa_task.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.description IS '描述';


--
-- Name: COLUMN oa_task.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.creater_id IS '创建人id';


--
-- Name: COLUMN oa_task.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.create_datetime IS '创建时间';


--
-- Name: COLUMN oa_task.isclose; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.isclose IS '是否关闭';


--
-- Name: COLUMN oa_task.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_task.is_deleted IS 'd是否删除';


--
-- Name: oa_topic_rep; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oa_topic_rep (
    id character varying(10) NOT NULL,
    topic_id character varying(10) NOT NULL,
    rep_id character varying(10) NOT NULL,
    content text NOT NULL,
    create_datetime character varying(20) NOT NULL,
    zan integer
);


ALTER TABLE public.oa_topic_rep OWNER TO postgres;

--
-- Name: TABLE oa_topic_rep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE oa_topic_rep IS '话题回复';


--
-- Name: COLUMN oa_topic_rep.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_topic_rep.id IS 'id';


--
-- Name: COLUMN oa_topic_rep.topic_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_topic_rep.topic_id IS '话题id';


--
-- Name: COLUMN oa_topic_rep.rep_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_topic_rep.rep_id IS '回复人';


--
-- Name: COLUMN oa_topic_rep.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_topic_rep.content IS '内容';


--
-- Name: COLUMN oa_topic_rep.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_topic_rep.create_datetime IS 'c创建时间';


--
-- Name: COLUMN oa_topic_rep.zan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_topic_rep.zan IS '点赞';


--
-- Name: oa_workreport; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oa_workreport (
    id character varying(10) NOT NULL,
    user_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    update_datetime character varying(20) NOT NULL,
    subject character varying(200) NOT NULL,
    content text NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    report_date character varying(10) NOT NULL,
    temp_id character varying(10) NOT NULL,
    is_submit integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oa_workreport OWNER TO postgres;

--
-- Name: TABLE oa_workreport; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE oa_workreport IS '工作报告';


--
-- Name: COLUMN oa_workreport.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreport.id IS 'id';


--
-- Name: COLUMN oa_workreport.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreport.user_id IS '创建者id';


--
-- Name: COLUMN oa_workreport.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreport.create_datetime IS '创建时间';


--
-- Name: COLUMN oa_workreport.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreport.update_datetime IS '更新时间';


--
-- Name: COLUMN oa_workreport.subject; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreport.subject IS '主题';


--
-- Name: COLUMN oa_workreport.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreport.content IS '内容';


--
-- Name: COLUMN oa_workreport.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreport.type IS '日志类别';


--
-- Name: COLUMN oa_workreport.report_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreport.report_date IS '报告日期';


--
-- Name: COLUMN oa_workreport.temp_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreport.temp_id IS '模板id';


--
-- Name: COLUMN oa_workreport.is_submit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreport.is_submit IS '是否提交';


--
-- Name: oa_workreporttemp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oa_workreporttemp (
    id character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    content text NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    postion_id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL
);


ALTER TABLE public.oa_workreporttemp OWNER TO postgres;

--
-- Name: TABLE oa_workreporttemp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE oa_workreporttemp IS '工作报告模板';


--
-- Name: COLUMN oa_workreporttemp.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreporttemp.id IS 'id';


--
-- Name: COLUMN oa_workreporttemp.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreporttemp.name IS '名称';


--
-- Name: COLUMN oa_workreporttemp.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreporttemp.content IS '内容';


--
-- Name: COLUMN oa_workreporttemp.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreporttemp.type IS '日志类别';


--
-- Name: COLUMN oa_workreporttemp.postion_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreporttemp.postion_id IS '岗位ID';


--
-- Name: COLUMN oa_workreporttemp.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN oa_workreporttemp.company_id IS '企业id';


--
-- Name: os_topic; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE os_topic (
    id character varying(10) NOT NULL,
    subject character varying(200) NOT NULL,
    content text NOT NULL,
    create_datetime character varying(20) NOT NULL,
    creater_id character varying(10) NOT NULL,
    category_id character varying(10) NOT NULL,
    zan integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.os_topic OWNER TO postgres;

--
-- Name: TABLE os_topic; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE os_topic IS '话题';


--
-- Name: COLUMN os_topic.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN os_topic.id IS 'id';


--
-- Name: COLUMN os_topic.subject; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN os_topic.subject IS '主题';


--
-- Name: COLUMN os_topic.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN os_topic.content IS '内容';


--
-- Name: COLUMN os_topic.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN os_topic.create_datetime IS 'c创建时间';


--
-- Name: COLUMN os_topic.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN os_topic.creater_id IS '创建人';


--
-- Name: COLUMN os_topic.category_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN os_topic.category_id IS '话题栏目';


--
-- Name: COLUMN os_topic.zan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN os_topic.zan IS '点赞';


--
-- Name: scm_bizcompetitor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_bizcompetitor (
    competitor_id character varying(10) NOT NULL,
    business_id character varying(10) NOT NULL,
    remark character varying(100)
);


ALTER TABLE public.scm_bizcompetitor OWNER TO postgres;

--
-- Name: TABLE scm_bizcompetitor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_bizcompetitor IS '商机竞争对手';


--
-- Name: COLUMN scm_bizcompetitor.competitor_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_bizcompetitor.competitor_id IS '竞争对手id';


--
-- Name: COLUMN scm_bizcompetitor.business_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_bizcompetitor.business_id IS '商机id';


--
-- Name: COLUMN scm_bizcompetitor.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_bizcompetitor.remark IS '备注';


--
-- Name: scm_competitor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_competitor (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    qyxz character varying(20),
    ppzmd character varying(50),
    sczy double precision,
    ppxz character varying(10) DEFAULT '自有'::character varying,
    jzwx character varying(50),
    remark text,
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    updater_id character varying(10),
    update_datetime character varying(20),
    delete_id character varying(10),
    delete_datetime character varying(20),
    is_deleted smallint
);


ALTER TABLE public.scm_competitor OWNER TO postgres;

--
-- Name: TABLE scm_competitor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_competitor IS '竞争对手';


--
-- Name: COLUMN scm_competitor.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.id IS 'id';


--
-- Name: COLUMN scm_competitor.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.company_id IS 'c企业id';


--
-- Name: COLUMN scm_competitor.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.name IS '名称';


--
-- Name: COLUMN scm_competitor.qyxz; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.qyxz IS '企业性质';


--
-- Name: COLUMN scm_competitor.ppzmd; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.ppzmd IS '品牌知名度';


--
-- Name: COLUMN scm_competitor.sczy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.sczy IS '市场占有';


--
-- Name: COLUMN scm_competitor.ppxz; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.ppxz IS '品牌性质';


--
-- Name: COLUMN scm_competitor.jzwx; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.jzwx IS '竞争威胁';


--
-- Name: COLUMN scm_competitor.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.remark IS '备注';


--
-- Name: COLUMN scm_competitor.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.creater_id IS '创建人id';


--
-- Name: COLUMN scm_competitor.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.create_datetime IS '创建时间';


--
-- Name: COLUMN scm_competitor.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.updater_id IS 'u修改人id';


--
-- Name: COLUMN scm_competitor.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.update_datetime IS 'u修改时间';


--
-- Name: COLUMN scm_competitor.delete_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.delete_id IS 'd删除人';


--
-- Name: COLUMN scm_competitor.delete_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.delete_datetime IS 'd删除时间';


--
-- Name: COLUMN scm_competitor.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_competitor.is_deleted IS 'd是否删除';


--
-- Name: scm_depot; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_depot (
    id character varying(10) NOT NULL,
    name character varying(20) NOT NULL,
    company_id character varying(10) NOT NULL,
    remark character varying(100)
);


ALTER TABLE public.scm_depot OWNER TO postgres;

--
-- Name: TABLE scm_depot; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_depot IS '仓库';


--
-- Name: COLUMN scm_depot.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_depot.id IS 'id';


--
-- Name: COLUMN scm_depot.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_depot.name IS '名称';


--
-- Name: COLUMN scm_depot.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_depot.company_id IS 'c企业id';


--
-- Name: COLUMN scm_depot.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_depot.remark IS '备注';


--
-- Name: scm_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_order (
    id character varying(10) NOT NULL,
    ordertype smallint DEFAULT 0 NOT NULL,
    customer_id character varying(10),
    business_id character varying(10),
    billsn character varying(20) NOT NULL,
    rebate double precision DEFAULT 0,
    rebate_amt numeric(10,2) DEFAULT 0,
    order_amt numeric(10,2) DEFAULT 0,
    sign_date character varying(10) NOT NULL,
    head_id character varying(10) NOT NULL,
    audit_status integer DEFAULT 0,
    pay_status integer DEFAULT 0,
    start_date character varying(10),
    end_date character varying(10),
    create_datetime character varying(20) NOT NULL,
    creater_id character varying(10) NOT NULL,
    submit_status integer DEFAULT 0 NOT NULL,
    is_deleted smallint,
    deleter_id character varying(10),
    delete_datetime character varying(20),
    updater_id character varying(10),
    update_datetime character varying(20),
    company_id character varying(10) NOT NULL,
    delivery_date character varying(10),
    auditor_id character varying(10),
    audit_datetime character varying(20),
    ordersn character varying(50),
    pay_datetime character varying(20)
);


ALTER TABLE public.scm_order OWNER TO postgres;

--
-- Name: TABLE scm_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_order IS '合同订单、退货单';


--
-- Name: COLUMN scm_order.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.id IS 'id';


--
-- Name: COLUMN scm_order.ordertype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.ordertype IS '订单类型';


--
-- Name: COLUMN scm_order.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.customer_id IS '客户id';


--
-- Name: COLUMN scm_order.business_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.business_id IS '商机';


--
-- Name: COLUMN scm_order.billsn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.billsn IS '单号';


--
-- Name: COLUMN scm_order.rebate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.rebate IS '折扣率';


--
-- Name: COLUMN scm_order.rebate_amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.rebate_amt IS '折扣金额';


--
-- Name: COLUMN scm_order.order_amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.order_amt IS '订单金额';


--
-- Name: COLUMN scm_order.sign_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.sign_date IS '签订日期';


--
-- Name: COLUMN scm_order.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.head_id IS '负责人';


--
-- Name: COLUMN scm_order.audit_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.audit_status IS '审批状态';


--
-- Name: COLUMN scm_order.pay_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.pay_status IS '付款状态';


--
-- Name: COLUMN scm_order.start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.start_date IS '开始日期';


--
-- Name: COLUMN scm_order.end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.end_date IS '结束日期';


--
-- Name: COLUMN scm_order.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.create_datetime IS '创建时间';


--
-- Name: COLUMN scm_order.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.creater_id IS '创建人id';


--
-- Name: COLUMN scm_order.submit_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.submit_status IS '提交状态';


--
-- Name: COLUMN scm_order.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.is_deleted IS 'd是否删除';


--
-- Name: COLUMN scm_order.deleter_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.deleter_id IS 'd删除人';


--
-- Name: COLUMN scm_order.delete_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.delete_datetime IS 'd删除时间';


--
-- Name: COLUMN scm_order.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.updater_id IS 'u修改人id';


--
-- Name: COLUMN scm_order.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.update_datetime IS 'u修改时间';


--
-- Name: COLUMN scm_order.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.company_id IS '企业ID';


--
-- Name: COLUMN scm_order.delivery_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.delivery_date IS '发货日期';


--
-- Name: COLUMN scm_order.auditor_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.auditor_id IS '审核人';


--
-- Name: COLUMN scm_order.audit_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.audit_datetime IS '审核时间';


--
-- Name: COLUMN scm_order.ordersn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.ordersn IS '订单编号';


--
-- Name: COLUMN scm_order.pay_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order.pay_datetime IS '付款时间';


--
-- Name: scm_order_data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_order_data (
    id character varying(10) NOT NULL,
    remark text,
    pact text,
    data text
);


ALTER TABLE public.scm_order_data OWNER TO postgres;

--
-- Name: TABLE scm_order_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_order_data IS '订单合同、单数据';


--
-- Name: COLUMN scm_order_data.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_data.id IS 'id';


--
-- Name: COLUMN scm_order_data.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_data.remark IS 'r备注';


--
-- Name: COLUMN scm_order_data.pact; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_data.pact IS '合同条款';


--
-- Name: COLUMN scm_order_data.data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_data.data IS 'd自定义数据';


--
-- Name: scm_order_product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_order_product (
    id character varying(10) NOT NULL,
    product_id character varying(10) NOT NULL,
    purchase_price numeric(10,2) DEFAULT 0,
    sale_price numeric(10,2),
    amount double precision DEFAULT 0,
    zkl double precision DEFAULT 0,
    zhamt numeric(10,2) DEFAULT 0,
    amt numeric(10,2) DEFAULT 0,
    description character varying(100),
    quoted_price numeric(10,2),
    tax_rate real,
    tax numeric(10,2)
);


ALTER TABLE public.scm_order_product OWNER TO postgres;

--
-- Name: TABLE scm_order_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_order_product IS '订单产品列表';


--
-- Name: COLUMN scm_order_product.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.id IS 'id';


--
-- Name: COLUMN scm_order_product.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.product_id IS '产品ID';


--
-- Name: COLUMN scm_order_product.purchase_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.purchase_price IS '采购价';


--
-- Name: COLUMN scm_order_product.sale_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.sale_price IS '销售单价';


--
-- Name: COLUMN scm_order_product.amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.amount IS '数量';


--
-- Name: COLUMN scm_order_product.zkl; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.zkl IS '折扣率';


--
-- Name: COLUMN scm_order_product.zhamt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.zhamt IS '折扣金额';


--
-- Name: COLUMN scm_order_product.amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.amt IS '金额';


--
-- Name: COLUMN scm_order_product.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.description IS '备注';


--
-- Name: COLUMN scm_order_product.quoted_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.quoted_price IS '报价';


--
-- Name: COLUMN scm_order_product.tax_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.tax_rate IS '税率';


--
-- Name: COLUMN scm_order_product.tax; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_order_product.tax IS '税率';


--
-- Name: scm_product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_product (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    billsn character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    unit character varying(10) NOT NULL,
    sale_price numeric(10,2) DEFAULT 0,
    purchase_price numeric(10,2) DEFAULT 0,
    category character varying(10) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    model character varying(30),
    remark text,
    stock_warn double precision
);


ALTER TABLE public.scm_product OWNER TO postgres;

--
-- Name: TABLE scm_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_product IS '产品';


--
-- Name: COLUMN scm_product.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product.id IS 'id';


--
-- Name: COLUMN scm_product.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product.company_id IS 'c企业id';


--
-- Name: COLUMN scm_product.billsn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product.billsn IS '单号';


--
-- Name: COLUMN scm_product.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product.name IS '名称';


--
-- Name: COLUMN scm_product.unit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product.unit IS '计量单位';


--
-- Name: COLUMN scm_product.sale_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product.sale_price IS '销售单价';


--
-- Name: COLUMN scm_product.purchase_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product.purchase_price IS '采购价';


--
-- Name: COLUMN scm_product.category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product.category IS '类别';


--
-- Name: COLUMN scm_product.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product.status IS '状态';


--
-- Name: COLUMN scm_product.model; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product.model IS '型号';


--
-- Name: COLUMN scm_product.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product.remark IS '备注';


--
-- Name: scm_product_price; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_product_price (
    id character varying(10) NOT NULL,
    product_id character varying(10) NOT NULL,
    cost numeric(10,2) NOT NULL,
    amount real DEFAULT 0 NOT NULL,
    price numeric(10,2) DEFAULT 0 NOT NULL,
    start_date character varying(10) NOT NULL,
    end_date character varying(10)
);


ALTER TABLE public.scm_product_price OWNER TO postgres;

--
-- Name: TABLE scm_product_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_product_price IS '产品价目列表';


--
-- Name: COLUMN scm_product_price.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price.id IS 'id';


--
-- Name: COLUMN scm_product_price.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price.product_id IS 'product_id';


--
-- Name: COLUMN scm_product_price.cost; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price.cost IS '成本';


--
-- Name: COLUMN scm_product_price.amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price.amount IS '数量';


--
-- Name: COLUMN scm_product_price.price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price.price IS '售价';


--
-- Name: COLUMN scm_product_price.start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price.start_date IS '开始日期';


--
-- Name: COLUMN scm_product_price.end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price.end_date IS '结束日期';


--
-- Name: scm_product_price_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_product_price_order (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    subject character varying(50) NOT NULL,
    start_date character varying(10) NOT NULL,
    end_date character varying(10),
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    remark text,
    submit_status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.scm_product_price_order OWNER TO postgres;

--
-- Name: TABLE scm_product_price_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_product_price_order IS '产品价目单';


--
-- Name: COLUMN scm_product_price_order.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price_order.id IS 'id';


--
-- Name: COLUMN scm_product_price_order.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price_order.company_id IS 'c企业id';


--
-- Name: COLUMN scm_product_price_order.subject; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price_order.subject IS '主题';


--
-- Name: COLUMN scm_product_price_order.start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price_order.start_date IS '开始日期';


--
-- Name: COLUMN scm_product_price_order.end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price_order.end_date IS '结束日期';


--
-- Name: COLUMN scm_product_price_order.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price_order.creater_id IS '创建者id';


--
-- Name: COLUMN scm_product_price_order.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price_order.create_datetime IS '创建时间';


--
-- Name: COLUMN scm_product_price_order.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price_order.remark IS 'r备注';


--
-- Name: COLUMN scm_product_price_order.submit_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_product_price_order.submit_status IS '提交状态';


--
-- Name: scm_stock; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_stock (
    product_id character varying(10) NOT NULL,
    depot_id character varying(10) NOT NULL,
    amount double precision DEFAULT 0 NOT NULL,
    cost numeric(10,2),
    lock_amount double precision DEFAULT 0,
    onway_amount double precision DEFAULT 0
);


ALTER TABLE public.scm_stock OWNER TO postgres;

--
-- Name: TABLE scm_stock; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_stock IS '库存';


--
-- Name: COLUMN scm_stock.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock.product_id IS 'product_id';


--
-- Name: COLUMN scm_stock.depot_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock.depot_id IS '仓库id';


--
-- Name: COLUMN scm_stock.amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock.amount IS '数量';


--
-- Name: COLUMN scm_stock.cost; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock.cost IS '单位成本';


--
-- Name: COLUMN scm_stock.lock_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock.lock_amount IS 'l锁定数量';


--
-- Name: COLUMN scm_stock.onway_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock.onway_amount IS '在途数量';


--
-- Name: scm_stock_allot; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_stock_allot (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    billsn character varying(20) NOT NULL,
    head_id character varying(10) NOT NULL,
    bill_date character varying(10) NOT NULL,
    remark text,
    submit_status integer DEFAULT 0 NOT NULL,
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    updater_id character varying(10),
    update_datetime character varying(20),
    delete_datetime character varying(20),
    deleter_id character varying(10),
    is_deleted smallint,
    to_depot_id character varying(10) NOT NULL,
    out_depot_id character varying(10) NOT NULL
);


ALTER TABLE public.scm_stock_allot OWNER TO postgres;

--
-- Name: TABLE scm_stock_allot; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_stock_allot IS '调拨';


--
-- Name: COLUMN scm_stock_allot.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.id IS 'id';


--
-- Name: COLUMN scm_stock_allot.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.company_id IS 'c企业id';


--
-- Name: COLUMN scm_stock_allot.billsn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.billsn IS '单号';


--
-- Name: COLUMN scm_stock_allot.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.head_id IS '负责人';


--
-- Name: COLUMN scm_stock_allot.bill_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.bill_date IS 'b单据日期';


--
-- Name: COLUMN scm_stock_allot.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.remark IS 'r备注';


--
-- Name: COLUMN scm_stock_allot.submit_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.submit_status IS '提交状态';


--
-- Name: COLUMN scm_stock_allot.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.creater_id IS 'c创建人';


--
-- Name: COLUMN scm_stock_allot.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.create_datetime IS 'c创建时间';


--
-- Name: COLUMN scm_stock_allot.updater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.updater_id IS 'u修改人id';


--
-- Name: COLUMN scm_stock_allot.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.update_datetime IS 'u修改时间';


--
-- Name: COLUMN scm_stock_allot.delete_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.delete_datetime IS 'd删除时间';


--
-- Name: COLUMN scm_stock_allot.deleter_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.deleter_id IS 'd删除人';


--
-- Name: COLUMN scm_stock_allot.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.is_deleted IS 'd是否删除';


--
-- Name: COLUMN scm_stock_allot.to_depot_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.to_depot_id IS '调入仓库';


--
-- Name: COLUMN scm_stock_allot.out_depot_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot.out_depot_id IS '调出仓库';


--
-- Name: scm_stock_allot_list; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_stock_allot_list (
    id character varying(10) NOT NULL,
    product_id character varying(10) NOT NULL,
    amount double precision DEFAULT 0 NOT NULL
);


ALTER TABLE public.scm_stock_allot_list OWNER TO postgres;

--
-- Name: TABLE scm_stock_allot_list; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_stock_allot_list IS '调拨明细';


--
-- Name: COLUMN scm_stock_allot_list.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot_list.id IS 'id';


--
-- Name: COLUMN scm_stock_allot_list.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot_list.product_id IS '产品ID';


--
-- Name: COLUMN scm_stock_allot_list.amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_allot_list.amount IS '数量';


--
-- Name: scm_stock_check; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_stock_check (
    id character varying(10) NOT NULL,
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    remark text,
    head_id character varying(10) NOT NULL,
    bill_date character varying(10) NOT NULL,
    billsn character varying(20) NOT NULL,
    company_id character varying(10) NOT NULL,
    submit_status integer DEFAULT 0 NOT NULL,
    depot_id character varying(10) NOT NULL,
    updater_id character varying(10),
    update_datetime character varying(20),
    deleter_id character varying(10),
    delete_datetime character varying(20),
    is_deleted smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.scm_stock_check OWNER TO postgres;

--
-- Name: TABLE scm_stock_check; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_stock_check IS '盘点';


--
-- Name: COLUMN scm_stock_check.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check.id IS 'id';


--
-- Name: COLUMN scm_stock_check.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check.creater_id IS 'c创建人';


--
-- Name: COLUMN scm_stock_check.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check.create_datetime IS '创建时间';


--
-- Name: COLUMN scm_stock_check.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check.remark IS 'r备注';


--
-- Name: COLUMN scm_stock_check.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check.head_id IS '负责人';


--
-- Name: COLUMN scm_stock_check.bill_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check.bill_date IS 'b单据日期';


--
-- Name: COLUMN scm_stock_check.billsn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check.billsn IS '单号';


--
-- Name: COLUMN scm_stock_check.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check.company_id IS 'c企业id';


--
-- Name: COLUMN scm_stock_check.submit_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check.submit_status IS '提交状态';


--
-- Name: COLUMN scm_stock_check.depot_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check.depot_id IS '仓库';


--
-- Name: scm_stock_check_list; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_stock_check_list (
    id character varying(10) NOT NULL,
    product_id character varying(10) NOT NULL,
    amount double precision DEFAULT 0 NOT NULL,
    amount2 real
);


ALTER TABLE public.scm_stock_check_list OWNER TO postgres;

--
-- Name: TABLE scm_stock_check_list; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_stock_check_list IS '盘点明细';


--
-- Name: COLUMN scm_stock_check_list.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check_list.id IS 'id';


--
-- Name: COLUMN scm_stock_check_list.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check_list.product_id IS '产品ID';


--
-- Name: COLUMN scm_stock_check_list.amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check_list.amount IS '数量';


--
-- Name: COLUMN scm_stock_check_list.amount2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_stock_check_list.amount2 IS '盘点数量';


--
-- Name: scm_storage_bill; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_storage_bill (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    billsn character varying(20) NOT NULL,
    depot_id character varying(10),
    bill_date character varying(10) NOT NULL,
    head_id character varying(10),
    attn character varying(10),
    remark text,
    order_id character varying(10),
    type integer NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    delete_datetime character varying(20),
    deleter_id character varying(10),
    is_deleted smallint DEFAULT 0 NOT NULL,
    updater_id character varying(10),
    update_datetime character varying(20),
    ordersn character varying(50)
);


ALTER TABLE public.scm_storage_bill OWNER TO postgres;

--
-- Name: TABLE scm_storage_bill; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_storage_bill IS '出入库单';


--
-- Name: COLUMN scm_storage_bill.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.id IS 'id';


--
-- Name: COLUMN scm_storage_bill.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.company_id IS 'c企业id';


--
-- Name: COLUMN scm_storage_bill.billsn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.billsn IS '单号';


--
-- Name: COLUMN scm_storage_bill.depot_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.depot_id IS '仓库id';


--
-- Name: COLUMN scm_storage_bill.bill_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.bill_date IS 'b单据日期';


--
-- Name: COLUMN scm_storage_bill.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.head_id IS 'h负责人';


--
-- Name: COLUMN scm_storage_bill.attn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.attn IS 'a经办人';


--
-- Name: COLUMN scm_storage_bill.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.remark IS 'r备注';


--
-- Name: COLUMN scm_storage_bill.order_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.order_id IS '销售/采购 订单/退货单';


--
-- Name: COLUMN scm_storage_bill.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.type IS '出入库类型';


--
-- Name: COLUMN scm_storage_bill.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.status IS '状态';


--
-- Name: COLUMN scm_storage_bill.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.creater_id IS '创建人id';


--
-- Name: COLUMN scm_storage_bill.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.create_datetime IS 'c创建时间';


--
-- Name: COLUMN scm_storage_bill.delete_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.delete_datetime IS 'd删除时间';


--
-- Name: COLUMN scm_storage_bill.deleter_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.deleter_id IS 'd删除人';


--
-- Name: COLUMN scm_storage_bill.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.is_deleted IS 'd是否删除';


--
-- Name: COLUMN scm_storage_bill.ordersn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill.ordersn IS '订单编号';


--
-- Name: scm_storage_bill_list; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scm_storage_bill_list (
    id character varying(10) NOT NULL,
    product_id character varying(10) NOT NULL,
    amount double precision DEFAULT 0 NOT NULL,
    remark character varying(100),
    balance double precision
);


ALTER TABLE public.scm_storage_bill_list OWNER TO postgres;

--
-- Name: TABLE scm_storage_bill_list; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE scm_storage_bill_list IS '出入库产品列表';


--
-- Name: COLUMN scm_storage_bill_list.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill_list.id IS 'id';


--
-- Name: COLUMN scm_storage_bill_list.product_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill_list.product_id IS '产品ID';


--
-- Name: COLUMN scm_storage_bill_list.amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill_list.amount IS '数量';


--
-- Name: COLUMN scm_storage_bill_list.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill_list.remark IS '备注';


--
-- Name: COLUMN scm_storage_bill_list.balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN scm_storage_bill_list.balance IS '结余库存';


--
-- Name: sso_action_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_action_log (
    id character varying(10) NOT NULL,
    user_id character varying(10) NOT NULL,
    module_name character varying(100) NOT NULL,
    action_name character varying(100) NOT NULL,
    content character varying(500) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    ip character varying(30) NOT NULL
);


ALTER TABLE public.sso_action_log OWNER TO postgres;

--
-- Name: TABLE sso_action_log; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sso_action_log IS '操作日志表';


--
-- Name: COLUMN sso_action_log.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_action_log.id IS 'id';


--
-- Name: COLUMN sso_action_log.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_action_log.user_id IS '用户id';


--
-- Name: COLUMN sso_action_log.module_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_action_log.module_name IS '模块名称';


--
-- Name: COLUMN sso_action_log.action_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_action_log.action_name IS '操作名称';


--
-- Name: COLUMN sso_action_log.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_action_log.content IS '操作内容';


--
-- Name: COLUMN sso_action_log.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_action_log.create_datetime IS '创建时间';


--
-- Name: COLUMN sso_action_log.ip; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_action_log.ip IS 'IP';


--
-- Name: sso_company; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_company (
    id character varying(10) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    short_name character varying(50) NOT NULL,
    industry character varying(10) NOT NULL,
    telephone character varying(50),
    fax character varying(30),
    address character varying(100) NOT NULL,
    reg_email character varying(50) NOT NULL,
    reg_date character varying(10) NOT NULL,
    expiry_date character varying(10) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    file_storage_size integer DEFAULT (-1),
    province character varying(10),
    province_name character varying(50),
    city character varying(10),
    city_name character varying(50),
    area character varying(10),
    area_name character varying(50),
    wx_appid character varying(50),
    wx_secret character varying(50),
    wxid character varying(50),
    wx_account character varying(50),
    wx_type integer,
    wx_qrcode character varying(100),
    config text
);


ALTER TABLE public.sso_company OWNER TO postgres;

--
-- Name: TABLE sso_company; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sso_company IS '企业';


--
-- Name: COLUMN sso_company.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.id IS 'id';


--
-- Name: COLUMN sso_company.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.code IS '编码';


--
-- Name: COLUMN sso_company.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.name IS '名称';


--
-- Name: COLUMN sso_company.short_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.short_name IS '简称';


--
-- Name: COLUMN sso_company.industry; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.industry IS '行业';


--
-- Name: COLUMN sso_company.telephone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.telephone IS '电话';


--
-- Name: COLUMN sso_company.fax; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.fax IS '传真';


--
-- Name: COLUMN sso_company.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.address IS '地址';


--
-- Name: COLUMN sso_company.reg_email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.reg_email IS '注册邮箱';


--
-- Name: COLUMN sso_company.reg_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.reg_date IS '注册日期';


--
-- Name: COLUMN sso_company.expiry_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.expiry_date IS '失效日期';


--
-- Name: COLUMN sso_company.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.status IS '状态';


--
-- Name: COLUMN sso_company.file_storage_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.file_storage_size IS '文件存储大小';


--
-- Name: COLUMN sso_company.province; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.province IS '省份';


--
-- Name: COLUMN sso_company.province_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.province_name IS '省份名称';


--
-- Name: COLUMN sso_company.city; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.city IS '市级';


--
-- Name: COLUMN sso_company.city_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.city_name IS '市级名称';


--
-- Name: COLUMN sso_company.area; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.area IS '县级';


--
-- Name: COLUMN sso_company.area_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.area_name IS '县级名称';


--
-- Name: COLUMN sso_company.wx_appid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.wx_appid IS '微信开发凭证appid';


--
-- Name: COLUMN sso_company.wx_secret; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.wx_secret IS '微信凭证';


--
-- Name: COLUMN sso_company.wxid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.wxid IS '微信原始id';


--
-- Name: COLUMN sso_company.wx_account; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.wx_account IS '微信号';


--
-- Name: COLUMN sso_company.wx_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.wx_type IS '微信类型';


--
-- Name: COLUMN sso_company.wx_qrcode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.wx_qrcode IS '微信二维码';


--
-- Name: COLUMN sso_company.config; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_company.config IS '系统设置';


--
-- Name: sso_daily_phrase; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_daily_phrase (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    content text NOT NULL,
    sort_num integer DEFAULT 1 NOT NULL,
    is_show integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.sso_daily_phrase OWNER TO postgres;

--
-- Name: sso_department; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_department (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(200),
    parent_id character varying(10),
    parentids character varying(50),
    head_id character varying(10)
);


ALTER TABLE public.sso_department OWNER TO postgres;

--
-- Name: TABLE sso_department; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sso_department IS '部门';


--
-- Name: COLUMN sso_department.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_department.id IS 'id';


--
-- Name: COLUMN sso_department.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_department.company_id IS '企业id';


--
-- Name: COLUMN sso_department.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_department.name IS '部门名';


--
-- Name: COLUMN sso_department.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_department.description IS '部门描述';


--
-- Name: COLUMN sso_department.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_department.parent_id IS '父类部门id';


--
-- Name: COLUMN sso_department.parentids; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_department.parentids IS 'p父级id集合';


--
-- Name: COLUMN sso_department.head_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_department.head_id IS 'h负责人';


--
-- Name: sso_event; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_event (
    id character varying(10) NOT NULL,
    subject character varying(50) NOT NULL,
    start_date character varying(10) NOT NULL,
    start_time time without time zone,
    end_date character varying(10) NOT NULL,
    end_time time without time zone,
    venue character varying(100) NOT NULL,
    contacts_id integer NOT NULL,
    customer_id character varying(10) NOT NULL,
    creater_id character varying(10) NOT NULL,
    create_datetime character varying(20) NOT NULL,
    update_date character varying(10) NOT NULL,
    update_datetime character varying(20),
    relation_id character varying(50),
    repeat integer NOT NULL,
    description text NOT NULL,
    isclose integer NOT NULL,
    is_deleted smallint NOT NULL
);


ALTER TABLE public.sso_event OWNER TO postgres;

--
-- Name: TABLE sso_event; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sso_event IS '日程';


--
-- Name: COLUMN sso_event.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.id IS 'id';


--
-- Name: COLUMN sso_event.subject; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.subject IS '主题';


--
-- Name: COLUMN sso_event.start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.start_date IS '开始日期';


--
-- Name: COLUMN sso_event.start_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.start_time IS '开始时间';


--
-- Name: COLUMN sso_event.end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.end_date IS '结束日期';


--
-- Name: COLUMN sso_event.end_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.end_time IS '结束时间';


--
-- Name: COLUMN sso_event.venue; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.venue IS '活动地点';


--
-- Name: COLUMN sso_event.contacts_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.contacts_id IS '联系人id';


--
-- Name: COLUMN sso_event.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.customer_id IS '客户id';


--
-- Name: COLUMN sso_event.creater_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.creater_id IS '创建人id';


--
-- Name: COLUMN sso_event.create_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.create_datetime IS 'c创建时间';


--
-- Name: COLUMN sso_event.update_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.update_date IS '修改日期';


--
-- Name: COLUMN sso_event.update_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.update_datetime IS '修改时间';


--
-- Name: COLUMN sso_event.relation_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.relation_id IS 'r关联ID';


--
-- Name: COLUMN sso_event.repeat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.repeat IS '是否重复';


--
-- Name: COLUMN sso_event.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.description IS '描述';


--
-- Name: COLUMN sso_event.isclose; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.isclose IS '是否关闭';


--
-- Name: COLUMN sso_event.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_event.is_deleted IS 'd是否删除';


--
-- Name: sso_fields; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_fields (
    id character varying(10) NOT NULL,
    form_id character varying(10) NOT NULL,
    is_main integer NOT NULL,
    field character varying(50) NOT NULL,
    label character varying(100) NOT NULL,
    form_type character varying(20) NOT NULL,
    default_value character varying(100) NOT NULL,
    color character varying(20) NOT NULL,
    max_length integer NOT NULL,
    is_unique integer NOT NULL,
    is_null integer NOT NULL,
    is_validate integer NOT NULL,
    in_index integer NOT NULL,
    in_add integer DEFAULT 1 NOT NULL,
    input_tips character varying(50),
    setting text NOT NULL,
    sort_num integer NOT NULL,
    operating integer NOT NULL
);


ALTER TABLE public.sso_fields OWNER TO postgres;

--
-- Name: TABLE sso_fields; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sso_fields IS '字段';


--
-- Name: COLUMN sso_fields.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.id IS 'id';


--
-- Name: COLUMN sso_fields.form_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.form_id IS '表单ID';


--
-- Name: COLUMN sso_fields.is_main; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.is_main IS '主表字段';


--
-- Name: COLUMN sso_fields.field; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.field IS '数据库字段名';


--
-- Name: COLUMN sso_fields.label; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.label IS '显示标识';


--
-- Name: COLUMN sso_fields.form_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.form_type IS '数据类型';


--
-- Name: COLUMN sso_fields.default_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.default_value IS '默认值';


--
-- Name: COLUMN sso_fields.color; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.color IS '颜色';


--
-- Name: COLUMN sso_fields.max_length; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.max_length IS '字段长度';


--
-- Name: COLUMN sso_fields.is_unique; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.is_unique IS '是否唯一';


--
-- Name: COLUMN sso_fields.is_null; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.is_null IS '是否允许为空';


--
-- Name: COLUMN sso_fields.is_validate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.is_validate IS '是否验证';


--
-- Name: COLUMN sso_fields.in_index; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.in_index IS '是否列表页显示';


--
-- Name: COLUMN sso_fields.in_add; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.in_add IS '是否添加时显示';


--
-- Name: COLUMN sso_fields.input_tips; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.input_tips IS '输入提示';


--
-- Name: COLUMN sso_fields.setting; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.setting IS '设置';


--
-- Name: COLUMN sso_fields.sort_num; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.sort_num IS '顺序';


--
-- Name: COLUMN sso_fields.operating; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_fields.operating IS '操作';


--
-- Name: sso_form; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_form (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    module_name character varying(100) NOT NULL
);


ALTER TABLE public.sso_form OWNER TO postgres;

--
-- Name: TABLE sso_form; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sso_form IS '表单';


--
-- Name: COLUMN sso_form.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_form.id IS 'id';


--
-- Name: COLUMN sso_form.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_form.company_id IS '企业id';


--
-- Name: COLUMN sso_form.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_form.code IS '代码';


--
-- Name: COLUMN sso_form.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_form.name IS '名称';


--
-- Name: COLUMN sso_form.module_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_form.module_name IS '模块名称';


--
-- Name: sso_parame; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_parame (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    parent_id character varying(10),
    name character varying(20),
    sort_num integer,
    is_end integer DEFAULT 0 NOT NULL,
    type integer NOT NULL,
    description character varying(200)
);


ALTER TABLE public.sso_parame OWNER TO postgres;

--
-- Name: TABLE sso_parame; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sso_parame IS '参数';


--
-- Name: COLUMN sso_parame.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_parame.id IS 'id';


--
-- Name: COLUMN sso_parame.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_parame.company_id IS '企业id';


--
-- Name: COLUMN sso_parame.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_parame.parent_id IS '父类id';


--
-- Name: COLUMN sso_parame.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_parame.name IS '名称';


--
-- Name: COLUMN sso_parame.sort_num; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_parame.sort_num IS '顺序号';


--
-- Name: COLUMN sso_parame.is_end; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_parame.is_end IS '终态';


--
-- Name: COLUMN sso_parame.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_parame.type IS '类别';


--
-- Name: COLUMN sso_parame.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_parame.description IS '描述';


--
-- Name: sso_person; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_person (
    id character varying(10) NOT NULL,
    realname character varying(20) NOT NULL,
    sex integer DEFAULT 0 NOT NULL,
    email character varying(50),
    mobile character varying(20),
    telephone character varying(50),
    address character varying(100),
    weixinid character varying(50),
    head_pic character varying(50),
    department character varying(20),
    post character varying(20),
    saltname character varying(20),
    qq character varying(20),
    xinzuo character varying(10),
    blood_type character varying(10),
    "character" character varying(10),
    company_id character varying(10)
);


ALTER TABLE public.sso_person OWNER TO postgres;

--
-- Name: TABLE sso_person; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sso_person IS '人员属性表';


--
-- Name: COLUMN sso_person.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.id IS 'id';


--
-- Name: COLUMN sso_person.realname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.realname IS '真实姓名';


--
-- Name: COLUMN sso_person.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.sex IS '性别';


--
-- Name: COLUMN sso_person.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.email IS '邮箱';


--
-- Name: COLUMN sso_person.mobile; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.mobile IS '手机';


--
-- Name: COLUMN sso_person.telephone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.telephone IS '电话';


--
-- Name: COLUMN sso_person.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.address IS '地址';


--
-- Name: COLUMN sso_person.weixinid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.weixinid IS '微信号';


--
-- Name: COLUMN sso_person.head_pic; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.head_pic IS '头像';


--
-- Name: COLUMN sso_person.department; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.department IS '部门';


--
-- Name: COLUMN sso_person.post; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.post IS '岗位';


--
-- Name: COLUMN sso_person.saltname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.saltname IS '称呼';


--
-- Name: COLUMN sso_person.qq; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.qq IS 'qq';


--
-- Name: COLUMN sso_person.xinzuo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.xinzuo IS '星座';


--
-- Name: COLUMN sso_person.blood_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.blood_type IS '血型';


--
-- Name: COLUMN sso_person."character"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person."character" IS '性格';


--
-- Name: COLUMN sso_person.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person.company_id IS '企业id';


--
-- Name: sso_person_data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_person_data (
    id character varying(10) NOT NULL,
    data text NOT NULL
);


ALTER TABLE public.sso_person_data OWNER TO postgres;

--
-- Name: TABLE sso_person_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sso_person_data IS '人员属性数据';


--
-- Name: COLUMN sso_person_data.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person_data.id IS 'id';


--
-- Name: COLUMN sso_person_data.data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_person_data.data IS 'd自定义数据';


--
-- Name: sso_position; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_position (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    parent_id character varying(10),
    parentids character varying(50),
    department_id character varying(10),
    departids character varying(100),
    name character varying(20) NOT NULL,
    description character varying(200),
    permission text,
    quota smallint DEFAULT 1,
    type integer,
    sort_num integer DEFAULT 1,
    is_head integer,
    m integer
);


ALTER TABLE public.sso_position OWNER TO postgres;

--
-- Name: TABLE sso_position; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sso_position IS '岗位';


--
-- Name: COLUMN sso_position.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.id IS 'id';


--
-- Name: COLUMN sso_position.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.company_id IS '企业id';


--
-- Name: COLUMN sso_position.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.parent_id IS '父级id';


--
-- Name: COLUMN sso_position.parentids; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.parentids IS 'p父级id集合';


--
-- Name: COLUMN sso_position.department_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.department_id IS '部门id';


--
-- Name: COLUMN sso_position.departids; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.departids IS 'p父级部门id组合';


--
-- Name: COLUMN sso_position.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.name IS '名称';


--
-- Name: COLUMN sso_position.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.description IS '描述';


--
-- Name: COLUMN sso_position.permission; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.permission IS '权限';


--
-- Name: COLUMN sso_position.quota; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.quota IS '职位配额';


--
-- Name: COLUMN sso_position.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.type IS '类型
0：部门
1：岗位';


--
-- Name: COLUMN sso_position.sort_num; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.sort_num IS '排序号';


--
-- Name: COLUMN sso_position.is_head; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.is_head IS '部门负责岗位';


--
-- Name: COLUMN sso_position.m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_position.m IS '是否管理类';


--
-- Name: sso_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sso_user (
    id character varying(10) NOT NULL,
    company_id character varying(10) NOT NULL,
    position_id character varying(10),
    is_admin integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    uname character varying(20) NOT NULL,
    password character varying(32) NOT NULL,
    dashboard text,
    login_ip character varying(20),
    last_login_time character varying(20),
    reg_date character varying(10),
    remark character varying(100)
);


ALTER TABLE public.sso_user OWNER TO postgres;

--
-- Name: TABLE sso_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sso_user IS '用户';


--
-- Name: COLUMN sso_user.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.id IS 'id';


--
-- Name: COLUMN sso_user.company_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.company_id IS '企业id';


--
-- Name: COLUMN sso_user.position_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.position_id IS '岗位id';


--
-- Name: COLUMN sso_user.is_admin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.is_admin IS '是否管理员';


--
-- Name: COLUMN sso_user.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.status IS '状态';


--
-- Name: COLUMN sso_user.uname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.uname IS '用户名';


--
-- Name: COLUMN sso_user.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.password IS '密码';


--
-- Name: COLUMN sso_user.dashboard; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.dashboard IS '个人面板';


--
-- Name: COLUMN sso_user.login_ip; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.login_ip IS '登录ip';


--
-- Name: COLUMN sso_user.last_login_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.last_login_time IS '最后登录时间';


--
-- Name: COLUMN sso_user.reg_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.reg_date IS '注册日期';


--
-- Name: COLUMN sso_user.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN sso_user.remark IS '备注';


--
-- Name: v_position; Type: VIEW; Schema: public; Owner: ecp
--

CREATE VIEW v_position AS
 SELECT d.company_id,
    d.name,
    d.id,
        CASE
            WHEN (d.type = 0) THEN d.parent_id
            ELSE d.department_id
        END AS pid,
    d.type,
    d.sort_num,
    d.department_id
   FROM sso_position d;


ALTER TABLE public.v_position OWNER TO ecp;

--
-- Name: VIEW v_position; Type: COMMENT; Schema: public; Owner: ecp
--

COMMENT ON VIEW v_position IS '岗位及部门';


--
-- Name: v_user_department; Type: VIEW; Schema: public; Owner: ecp
--

CREATE VIEW v_user_department AS
         SELECT u.id,
            ps.realname AS name,
            u.uname,
            p.department_id AS pid,
            10 AS type,
            1 AS sort_num,
            p.company_id
           FROM sso_user u,
            sso_person ps,
            sso_position p
          WHERE ((((p.id)::text = (u.position_id)::text) AND ((u.id)::text = (ps.id)::text)) AND (u.status = 1))
UNION
         SELECT p1.id,
            p1.name,
            ''::character varying AS uname,
            p1.parent_id AS pid,
            p1.type,
            p1.sort_num,
            p1.company_id
           FROM sso_position p1;


ALTER TABLE public.v_user_department OWNER TO ecp;

--
-- Name: VIEW v_user_department; Type: COMMENT; Schema: public; Owner: ecp
--

COMMENT ON VIEW v_user_department IS '用户部门';


--
-- Name: v_user_position; Type: VIEW; Schema: public; Owner: ecp
--

CREATE VIEW v_user_position AS
         SELECT u.id,
            ps.realname AS name,
            u.uname,
            p.id AS pid,
            10 AS type,
            1 AS sort_num,
            p.company_id
           FROM sso_user u,
            sso_person ps,
            sso_position p
          WHERE ((((p.id)::text = (u.position_id)::text) AND ((u.id)::text = (ps.id)::text)) AND (u.status = 1))
UNION
         SELECT p1.id,
            p1.name,
            ''::character varying AS uname,
            p1.parent_id AS pid,
            p1.type,
            p1.sort_num,
            p1.company_id
           FROM sso_position p1
          WHERE (p1.type = 1);


ALTER TABLE public.v_user_position OWNER TO ecp;

--
-- Name: VIEW v_user_position; Type: COMMENT; Schema: public; Owner: ecp
--

COMMENT ON VIEW v_user_position IS '用户岗位';


--
-- Name: wf_audit_detail; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wf_audit_detail (
    id character varying(10) NOT NULL,
    auditor_id character varying(10) NOT NULL,
    audit_datetime character varying(20) NOT NULL,
    audit_status smallint DEFAULT 2 NOT NULL,
    remark text
);


ALTER TABLE public.wf_audit_detail OWNER TO postgres;

--
-- Name: TABLE wf_audit_detail; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE wf_audit_detail IS '审核明细';


--
-- Name: COLUMN wf_audit_detail.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_audit_detail.id IS 'id';


--
-- Name: COLUMN wf_audit_detail.auditor_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_audit_detail.auditor_id IS '审核人id';


--
-- Name: COLUMN wf_audit_detail.audit_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_audit_detail.audit_datetime IS '审核时间';


--
-- Name: COLUMN wf_audit_detail.audit_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_audit_detail.audit_status IS '审批状态';


--
-- Name: COLUMN wf_audit_detail.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_audit_detail.remark IS 'r备注';


--
-- Name: wf_cc_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wf_cc_order (
    order_id character varying(100),
    actor_id character varying(100),
    status smallint
);


ALTER TABLE public.wf_cc_order OWNER TO postgres;

--
-- Name: TABLE wf_cc_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE wf_cc_order IS '抄送实例表';


--
-- Name: COLUMN wf_cc_order.order_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_cc_order.order_id IS '流程实例ID';


--
-- Name: COLUMN wf_cc_order.actor_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_cc_order.actor_id IS '参与者ID';


--
-- Name: COLUMN wf_cc_order.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_cc_order.status IS '状态';


--
-- Name: wf_hist_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wf_hist_order (
    id character varying(100) NOT NULL,
    process_id character varying(100) NOT NULL,
    order_state smallint NOT NULL,
    creator character varying(100),
    create_time character varying(50) NOT NULL,
    end_time character varying(50),
    expire_time character varying(50),
    priority smallint,
    parent_id character varying(100),
    order_no character varying(100),
    variable character varying(2000)
);


ALTER TABLE public.wf_hist_order OWNER TO postgres;

--
-- Name: TABLE wf_hist_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE wf_hist_order IS '历史流程实例表';


--
-- Name: COLUMN wf_hist_order.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_order.id IS '主键ID';


--
-- Name: COLUMN wf_hist_order.process_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_order.process_id IS '流程定义ID';


--
-- Name: COLUMN wf_hist_order.order_state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_order.order_state IS '状态';


--
-- Name: COLUMN wf_hist_order.creator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_order.creator IS '发起人';


--
-- Name: COLUMN wf_hist_order.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_order.create_time IS '发起时间';


--
-- Name: COLUMN wf_hist_order.end_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_order.end_time IS '完成时间';


--
-- Name: COLUMN wf_hist_order.expire_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_order.expire_time IS '期望完成时间';


--
-- Name: COLUMN wf_hist_order.priority; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_order.priority IS '优先级';


--
-- Name: COLUMN wf_hist_order.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_order.parent_id IS '父流程ID';


--
-- Name: COLUMN wf_hist_order.order_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_order.order_no IS '流程实例编号';


--
-- Name: COLUMN wf_hist_order.variable; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_order.variable IS '附属变量json存储';


--
-- Name: wf_hist_task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wf_hist_task (
    id character varying(100) NOT NULL,
    order_id character varying(100) NOT NULL,
    task_name character varying(100) NOT NULL,
    display_name character varying(200) NOT NULL,
    task_type smallint NOT NULL,
    perform_type smallint,
    task_state smallint NOT NULL,
    operator character varying(100),
    create_time character varying(50) NOT NULL,
    finish_time character varying(50),
    expire_time character varying(50),
    action_url character varying(200),
    parent_task_id character varying(100),
    variable character varying(2000)
);


ALTER TABLE public.wf_hist_task OWNER TO postgres;

--
-- Name: TABLE wf_hist_task; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE wf_hist_task IS '历史任务表';


--
-- Name: COLUMN wf_hist_task.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.id IS '主键ID';


--
-- Name: COLUMN wf_hist_task.order_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.order_id IS '流程实例ID';


--
-- Name: COLUMN wf_hist_task.task_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.task_name IS '任务名称';


--
-- Name: COLUMN wf_hist_task.display_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.display_name IS '任务显示名称';


--
-- Name: COLUMN wf_hist_task.task_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.task_type IS '任务类型';


--
-- Name: COLUMN wf_hist_task.perform_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.perform_type IS '参与类型';


--
-- Name: COLUMN wf_hist_task.task_state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.task_state IS '任务状态';


--
-- Name: COLUMN wf_hist_task.operator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.operator IS '任务处理人';


--
-- Name: COLUMN wf_hist_task.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.create_time IS '任务创建时间';


--
-- Name: COLUMN wf_hist_task.finish_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.finish_time IS '任务完成时间';


--
-- Name: COLUMN wf_hist_task.expire_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.expire_time IS '任务期望完成时间';


--
-- Name: COLUMN wf_hist_task.action_url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.action_url IS '任务处理url';


--
-- Name: COLUMN wf_hist_task.parent_task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.parent_task_id IS '父任务ID';


--
-- Name: COLUMN wf_hist_task.variable; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task.variable IS '附属变量json存储';


--
-- Name: wf_hist_task_actor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wf_hist_task_actor (
    task_id character varying(100) NOT NULL,
    actor_id character varying(100) NOT NULL
);


ALTER TABLE public.wf_hist_task_actor OWNER TO postgres;

--
-- Name: TABLE wf_hist_task_actor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE wf_hist_task_actor IS '历史任务参与者表';


--
-- Name: COLUMN wf_hist_task_actor.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task_actor.task_id IS '任务ID';


--
-- Name: COLUMN wf_hist_task_actor.actor_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_hist_task_actor.actor_id IS '参与者ID';


--
-- Name: wf_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wf_order (
    id character varying(100) NOT NULL,
    parent_id character varying(100),
    process_id character varying(100) NOT NULL,
    creator character varying(100),
    create_time character varying(50) NOT NULL,
    expire_time character varying(50),
    last_update_time character varying(50),
    last_updator character varying(100),
    priority smallint,
    parent_node_name character varying(100),
    order_no character varying(100),
    variable character varying(2000),
    version smallint
);


ALTER TABLE public.wf_order OWNER TO postgres;

--
-- Name: TABLE wf_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE wf_order IS '流程实例表';


--
-- Name: COLUMN wf_order.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.id IS '主键ID';


--
-- Name: COLUMN wf_order.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.parent_id IS '父流程ID';


--
-- Name: COLUMN wf_order.process_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.process_id IS '流程定义ID';


--
-- Name: COLUMN wf_order.creator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.creator IS '发起人';


--
-- Name: COLUMN wf_order.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.create_time IS '发起时间';


--
-- Name: COLUMN wf_order.expire_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.expire_time IS '期望完成时间';


--
-- Name: COLUMN wf_order.last_update_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.last_update_time IS '上次更新时间';


--
-- Name: COLUMN wf_order.last_updator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.last_updator IS '上次更新人';


--
-- Name: COLUMN wf_order.priority; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.priority IS '优先级';


--
-- Name: COLUMN wf_order.parent_node_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.parent_node_name IS '父流程依赖的节点名称';


--
-- Name: COLUMN wf_order.order_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.order_no IS '流程实例编号';


--
-- Name: COLUMN wf_order.variable; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.variable IS '附属变量json存储';


--
-- Name: COLUMN wf_order.version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_order.version IS '版本';


--
-- Name: wf_process; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wf_process (
    id character varying(100) NOT NULL,
    name character varying(100),
    display_name character varying(200),
    type character varying(100),
    instance_url character varying(200),
    state smallint,
    content text,
    version smallint,
    create_time character varying(50),
    creator character varying(50),
    company_id character varying(10)
);


ALTER TABLE public.wf_process OWNER TO postgres;

--
-- Name: TABLE wf_process; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE wf_process IS '流程定义表';


--
-- Name: COLUMN wf_process.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_process.id IS '主键ID';


--
-- Name: COLUMN wf_process.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_process.name IS '流程名称';


--
-- Name: COLUMN wf_process.display_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_process.display_name IS '流程显示名称';


--
-- Name: COLUMN wf_process.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_process.type IS '流程类型';


--
-- Name: COLUMN wf_process.instance_url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_process.instance_url IS '实例url';


--
-- Name: COLUMN wf_process.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_process.state IS '流程是否可用';


--
-- Name: COLUMN wf_process.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_process.content IS '流程模型定义';


--
-- Name: COLUMN wf_process.version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_process.version IS '版本';


--
-- Name: wf_surrogate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wf_surrogate (
    id character varying(100) NOT NULL,
    process_name character varying(100),
    operator character varying(100),
    surrogate character varying(100),
    odate character varying(64),
    sdate character varying(64),
    edate character varying(64),
    state smallint
);


ALTER TABLE public.wf_surrogate OWNER TO postgres;

--
-- Name: TABLE wf_surrogate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE wf_surrogate IS '委托代理表';


--
-- Name: COLUMN wf_surrogate.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_surrogate.id IS '主键ID';


--
-- Name: COLUMN wf_surrogate.process_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_surrogate.process_name IS '流程名称';


--
-- Name: COLUMN wf_surrogate.operator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_surrogate.operator IS '授权人';


--
-- Name: COLUMN wf_surrogate.surrogate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_surrogate.surrogate IS '代理人';


--
-- Name: COLUMN wf_surrogate.odate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_surrogate.odate IS '操作时间';


--
-- Name: COLUMN wf_surrogate.sdate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_surrogate.sdate IS '开始时间';


--
-- Name: COLUMN wf_surrogate.edate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_surrogate.edate IS '结束时间';


--
-- Name: COLUMN wf_surrogate.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_surrogate.state IS '状态';


--
-- Name: wf_task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wf_task (
    id character varying(100) NOT NULL,
    order_id character varying(100) NOT NULL,
    task_name character varying(100) NOT NULL,
    display_name character varying(200) NOT NULL,
    task_type smallint NOT NULL,
    perform_type smallint,
    operator character varying(100),
    create_time character varying(50),
    finish_time character varying(50),
    expire_time character varying(50),
    action_url character varying(200),
    parent_task_id character varying(100),
    variable character varying(2000),
    version smallint
);


ALTER TABLE public.wf_task OWNER TO postgres;

--
-- Name: TABLE wf_task; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE wf_task IS '任务表';


--
-- Name: COLUMN wf_task.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.id IS '主键ID';


--
-- Name: COLUMN wf_task.order_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.order_id IS '流程实例ID';


--
-- Name: COLUMN wf_task.task_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.task_name IS '任务名称';


--
-- Name: COLUMN wf_task.display_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.display_name IS '任务显示名称';


--
-- Name: COLUMN wf_task.task_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.task_type IS '任务类型';


--
-- Name: COLUMN wf_task.perform_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.perform_type IS '参与类型';


--
-- Name: COLUMN wf_task.operator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.operator IS '任务处理人';


--
-- Name: COLUMN wf_task.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.create_time IS '任务创建时间';


--
-- Name: COLUMN wf_task.finish_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.finish_time IS '任务完成时间';


--
-- Name: COLUMN wf_task.expire_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.expire_time IS '任务期望完成时间';


--
-- Name: COLUMN wf_task.action_url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.action_url IS '任务处理的url';


--
-- Name: COLUMN wf_task.parent_task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.parent_task_id IS '父任务ID';


--
-- Name: COLUMN wf_task.variable; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.variable IS '附属变量json存储';


--
-- Name: COLUMN wf_task.version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task.version IS '版本';


--
-- Name: wf_task_actor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wf_task_actor (
    task_id character varying(100) NOT NULL,
    actor_id character varying(100) NOT NULL
);


ALTER TABLE public.wf_task_actor OWNER TO postgres;

--
-- Name: TABLE wf_task_actor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE wf_task_actor IS '任务参与者表';


--
-- Name: COLUMN wf_task_actor.task_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task_actor.task_id IS '任务ID';


--
-- Name: COLUMN wf_task_actor.actor_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN wf_task_actor.actor_id IS '参与者ID';


--
-- Name: 98948; Type: BLOB; Schema: -; Owner: ecp
--

SELECT pg_catalog.lo_create('98948');


ALTER LARGE OBJECT 98948 OWNER TO ecp;

--
-- Data for Name: base_area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY base_area (id, pid, name, code, zone_type, sort_num) FROM stdin;
1	\N	北京		4	1
2	1	东城		4	1
3	1	西城		4	2
4	1	朝阳		4	3
5	1	丰台		4	4
6	1	石景山		4	5
7	1	海淀		4	6
8	1	门头沟		4	7
9	1	房山		4	8
10	1	通州		4	9
11	1	顺义		4	10
12	1	昌平		4	11
13	1	大兴		4	12
14	1	平谷		4	13
15	1	怀柔		4	14
16	1	密云		4	15
17	1	延庆		4	16
18	\N	上海		1	2
19	18	崇明		1	1
20	18	黄浦		1	2
21	18	卢湾		1	3
22	18	徐汇		1	4
23	18	长宁		1	5
24	18	静安		1	6
25	18	普陀		1	7
26	18	闸北		1	8
27	18	虹口		1	9
28	18	杨浦		1	10
29	18	闵行		1	11
30	18	宝山		1	12
31	18	嘉定		1	13
32	18	浦东		1	14
33	18	金山		1	15
34	18	松江		1	16
35	18	青浦		1	17
36	18	南汇		1	18
37	18	奉贤		1	19
38	\N	广东		2	3
39	38	广州		2	1
40	38	深圳		2	2
41	38	珠海		2	3
42	38	东莞		2	4
43	38	中山		2	5
44	38	佛山		2	6
45	38	惠州		2	7
46	38	河源		2	8
47	38	潮州		2	9
48	38	江门		2	10
49	38	揭阳		2	11
50	38	茂名		2	12
51	38	梅州		2	13
52	38	清远		2	14
53	38	汕头		2	15
54	38	汕尾		2	16
55	38	韶关		2	17
56	38	顺德		2	18
57	38	阳江		2	19
58	38	云浮		2	20
59	38	湛江		2	21
60	38	肇庆		2	22
61	\N	江苏		1	4
62	61	南京		1	1
63	61	常熟		1	2
64	61	常州		1	3
65	61	海门		1	4
66	61	淮安		1	5
67	61	江都		1	6
68	61	江阴		1	7
69	61	昆山		1	8
70	61	连云港		1	9
71	61	南通		1	10
72	61	启东		1	11
73	61	沭阳		1	12
74	61	宿迁		1	13
75	61	苏州		1	14
76	61	太仓		1	15
77	61	泰州		1	16
78	61	同里		1	17
79	61	无锡		1	18
80	61	徐州		1	19
81	61	盐城		1	20
82	61	扬州		1	21
83	61	宜兴		1	22
84	61	仪征		1	23
85	61	张家港		1	24
86	61	镇江		1	25
87	61	周庄		1	26
88	\N	浙江		1	5
89	88	杭州		1	1
90	88	安吉		1	2
91	88	慈溪		1	3
92	88	定海		1	4
93	88	奉化		1	5
94	88	海盐		1	6
95	88	黄岩		1	7
96	88	湖州		1	8
97	88	嘉兴		1	9
98	88	金华		1	10
99	88	临安		1	11
100	88	临海		1	12
101	88	丽水		1	13
102	88	宁波		1	14
103	88	瓯海		1	15
104	88	平湖		1	16
105	88	千岛湖		1	17
106	88	衢州		1	18
107	88	江山		1	19
108	88	瑞安		1	20
109	88	绍兴		1	21
110	88	嵊州		1	22
111	88	台州		1	23
112	88	温岭		1	24
113	88	温州		1	25
114	88	余姚		1	26
115	88	舟山		1	27
116	\N	重庆		6	6
117	116	万州		6	1
118	116	涪陵		6	2
119	116	渝中		6	3
120	116	大渡口		6	4
121	116	江北		6	5
122	116	沙坪坝		6	6
123	116	九龙坡		6	7
124	116	南岸		6	8
125	116	北碚		6	9
126	116	万盛		6	10
127	116	双挢		6	11
128	116	渝北		6	12
129	116	巴南		6	13
130	116	黔江		6	14
131	116	长寿		6	15
132	116	綦江		6	16
133	116	潼南		6	17
134	116	铜梁		6	18
135	116	大足		6	19
136	116	荣昌		6	20
137	116	壁山		6	21
138	116	梁平		6	22
139	116	城口		6	23
140	116	丰都		6	24
141	116	垫江		6	25
142	116	武隆		6	26
143	116	忠县		6	27
144	116	开县		6	28
145	116	云阳		6	29
146	116	奉节		6	30
147	116	巫山		6	31
148	116	巫溪		6	32
149	116	石柱		6	33
150	116	秀山		6	34
151	116	酉阳		6	35
152	116	彭水		6	36
153	116	江津		6	37
154	116	合川		6	38
155	116	永川		6	39
156	116	南川		6	40
157	\N	安徽		1	7
158	157	合肥		1	1
159	157	安庆		1	2
160	157	蚌埠		1	3
161	157	亳州		1	4
162	157	巢湖		1	5
163	157	滁州		1	6
164	157	阜阳		1	7
165	157	贵池		1	8
166	157	淮北		1	9
167	157	淮化		1	10
168	157	淮南		1	11
169	157	黄山		1	12
170	157	九华山		1	13
171	157	六安		1	14
172	157	马鞍山		1	15
173	157	宿州		1	16
174	157	铜陵		1	17
175	157	屯溪		1	18
176	157	芜湖		1	19
177	157	宣城		1	20
178	\N	福建		1	8
179	178	福州		1	1
180	178	厦门		1	2
181	178	泉州		1	3
182	178	漳州		1	4
183	178	龙岩		1	5
184	178	南平		1	6
185	178	宁德		1	7
186	178	莆田		1	8
187	178	三明		1	9
188	\N	甘肃		5	23
189	188	兰州		5	1
190	188	白银		5	2
191	188	定西		5	3
192	188	敦煌		5	4
193	188	甘南		5	5
194	188	金昌		5	6
195	188	酒泉		5	7
196	188	临夏		5	8
197	188	平凉		5	9
198	188	天水		5	10
199	188	武都		5	11
200	188	武威		5	12
201	188	西峰		5	13
202	188	张掖		5	14
203	\N	广西		2	9
204	203	南宁		2	1
205	203	百色		2	2
206	203	北海		2	3
207	203	桂林		2	4
208	203	防城港		2	5
209	203	贵港		2	6
210	203	河池		2	7
211	203	贺州		2	8
212	203	柳州		2	9
213	203	钦州		2	10
214	203	梧州		2	11
215	203	玉林		2	12
216	\N	贵州		6	23
217	216	贵阳		6	1
218	216	安顺		6	2
219	216	毕节		6	3
220	216	都匀		6	4
221	216	凯里		6	5
222	216	六盘水		6	6
223	216	铜仁		6	7
224	216	兴义		6	8
225	216	玉屏		6	9
226	216	遵义		6	10
227	\N	海南		2	10
228	227	海口		2	1
229	227	儋县		2	2
230	227	陵水		2	3
231	227	琼海		2	4
232	227	三亚		2	5
233	227	通什		2	6
234	227	万宁		2	7
235	\N	河北		3	11
236	235	石家庄		3	1
237	235	保定		3	2
238	235	北戴河		3	3
239	235	沧州		3	4
240	235	承德		3	5
241	235	丰润		3	6
242	235	邯郸		3	7
243	235	衡水		3	8
244	235	廊坊		3	9
245	235	南戴河		3	10
246	235	秦皇岛		3	11
247	235	唐山		3	12
248	235	新城		3	13
249	235	邢台		3	14
250	235	张家口		3	15
251	\N	黑龙江		7	12
252	251	哈尔滨		7	1
253	251	北安		7	2
254	251	大庆		7	3
255	251	大兴安岭		7	4
256	251	鹤岗		7	5
257	251	黑河		7	6
258	251	佳木斯		7	7
259	251	鸡西		7	8
260	251	牡丹江		7	9
261	251	齐齐哈尔		7	10
262	251	七台河		7	11
263	251	双鸭山		7	12
264	251	绥化		7	13
265	251	伊春		7	14
266	\N	河南		3	13
267	266	郑州		3	1
268	266	安阳		3	2
269	266	鹤壁		3	3
270	266	潢川		3	4
271	266	焦作		3	5
272	266	济源		3	6
273	266	开封		3	7
274	266	漯河		3	8
275	266	洛阳		3	9
276	266	南阳		3	10
277	266	平顶山		3	11
278	266	濮阳		3	12
279	266	三门峡		3	13
280	266	商丘		3	14
281	266	新乡		3	15
282	266	信阳		3	16
283	266	许昌		3	17
284	266	周口		3	18
285	266	驻马店		3	19
286	\N	湖北		3	14
287	286	武汉		3	1
288	286	恩施		3	2
289	286	鄂州		3	3
290	286	黄冈		3	4
291	286	黄石		3	5
292	286	荆门		3	6
293	286	荆州		3	7
294	286	潜江		3	8
295	286	十堰		3	9
296	286	随州		3	10
297	286	武穴		3	11
298	286	仙桃		3	12
299	286	咸宁		3	13
300	286	襄阳		3	14
301	286	襄樊		3	15
302	286	孝感		3	16
303	286	宜昌		3	17
304	\N	湖南		3	15
305	304	长沙		3	1
306	304	常德		3	2
307	304	郴州		3	3
308	304	衡阳		3	4
309	304	怀化		3	5
310	304	吉首		3	6
311	304	娄底		3	7
312	304	邵阳		3	8
313	304	湘潭		3	9
314	304	益阳		3	10
315	304	岳阳		3	11
316	304	永州		3	12
317	304	张家界		3	13
318	304	株洲		3	14
319	\N	江西		3	16
320	319	南昌		3	1
321	319	抚州		3	2
322	319	赣州		3	3
323	319	吉安		3	4
324	319	景德镇		3	5
325	319	井冈山		3	6
326	319	九江		3	7
327	319	庐山		3	8
328	319	萍乡		3	9
329	319	上饶		3	10
330	319	新余		3	11
331	319	宜春		3	12
332	319	鹰潭		3	13
333	\N	吉林		7	17
334	333	长春		7	1
335	333	吉林		7	2
336	333	白城		7	3
337	333	白山		7	4
338	333	珲春		7	5
339	333	辽源		7	6
340	333	梅河		7	7
341	333	四平		7	8
342	333	松原		7	9
343	333	通化		7	10
344	333	延吉		7	11
345	\N	辽宁		7	14
346	345	沈阳		7	1
347	345	鞍山		7	2
348	345	本溪		7	3
349	345	朝阳		7	4
350	345	大连		7	5
351	345	丹东		7	6
352	345	抚顺		7	7
353	345	阜新		7	8
354	345	葫芦岛		7	9
355	345	锦州		7	10
356	345	辽阳		7	11
357	345	盘锦		7	12
358	345	铁岭		7	13
359	345	营口		7	14
360	\N	内蒙古		4	18
361	360	呼和浩特		4	1
362	360	阿拉善盟		4	2
363	360	包头		4	3
364	360	赤峰		4	4
365	360	东胜		4	5
366	360	海拉尔		4	6
367	360	集宁		4	7
368	360	临河		4	8
369	360	通辽		4	9
370	360	乌海		4	10
371	360	乌兰浩特		4	11
372	360	锡林浩特		4	12
373	\N	宁夏		5	19
374	373	银川		5	1
375	373	固源		5	2
376	373	石嘴山		5	3
377	373	吴忠		5	4
378	\N	青海		5	20
379	378	西宁		5	1
380	378	德令哈		5	2
381	378	格尔木		5	3
382	378	共和		5	4
383	378	海东		5	5
384	378	海晏		5	6
385	378	玛沁		5	7
386	378	同仁		5	8
387	378	玉树		5	9
388	\N	山东		1	21
389	388	济南		1	1
390	388	滨州		1	2
391	388	兖州		1	3
392	388	德州		1	4
393	388	东营		1	5
394	388	菏泽		1	6
395	388	济宁		1	7
396	388	莱芜		1	8
397	388	聊城		1	9
398	388	临沂		1	10
399	388	蓬莱		1	11
400	388	青岛		1	12
401	388	曲阜		1	13
402	388	日照		1	14
403	388	泰安		1	15
404	388	潍坊		1	16
405	388	威海		1	17
406	388	烟台		1	18
407	388	枣庄		1	19
408	388	淄博		1	20
409	\N	山西		4	22
410	409	太原		4	1
411	409	长治		4	2
412	409	大同		4	3
413	409	候马		4	4
414	409	晋城		4	5
415	409	离石		4	6
416	409	临汾		4	7
417	409	宁武		4	8
418	409	朔州		4	9
419	409	忻州		4	10
420	409	阳泉		4	11
421	409	榆次		4	12
422	409	运城		4	13
423	\N	陕西		5	23
424	423	西安		5	1
425	423	安康		5	2
426	423	宝鸡		5	3
427	423	汉中		5	4
428	423	渭南		5	5
429	423	商州		5	6
430	423	绥德		5	7
431	423	铜川		5	8
432	423	咸阳		5	9
433	423	延安		5	10
434	423	榆林		5	11
435	\N	四川		6	24
436	435	成都		6	1
437	435	巴中		6	2
438	435	达川		6	3
439	435	德阳		6	4
440	435	都江堰		6	5
441	435	峨眉山		6	6
442	435	涪陵		6	7
443	435	广安		6	8
444	435	广元		6	9
445	435	九寨沟		6	10
446	435	康定		6	11
447	435	乐山		6	12
448	435	泸州		6	13
449	435	马尔康		6	14
450	435	绵阳		6	15
451	435	眉山		6	16
452	435	南充		6	17
453	435	内江		6	18
454	435	攀枝花		6	19
455	435	遂宁		6	20
456	435	汶川		6	21
457	435	西昌		6	22
458	435	雅安		6	23
459	435	宜宾		6	24
460	435	自贡		6	25
461	435	资阳		6	26
462	\N	天津		4	25
463	462	天津		4	1
464	462	和平		4	2
465	462	东丽		4	3
466	462	河东		4	4
467	462	西青		4	5
468	462	河西		4	6
469	462	津南		4	7
470	462	南开		4	8
471	462	北辰		4	9
472	\N	河北		4	26
473	472	武清		4	1
474	472	红挢		4	2
475	472	塘沽		4	3
476	472	汉沽		4	4
477	472	大港		4	5
478	472	宁河		4	6
479	472	静海		4	7
480	472	宝坻		4	8
481	472	蓟县		4	9
482	\N	新疆		5	27
483	482	乌鲁木齐		5	1
484	482	阿克苏		5	2
485	482	阿勒泰		5	3
486	482	阿图什		5	4
487	482	博乐		5	5
488	482	昌吉		5	6
489	482	东山		5	7
490	482	哈密		5	8
491	482	和田		5	9
492	482	喀什		5	10
493	482	克拉玛依		5	11
494	482	库车		5	12
495	482	库尔勒		5	13
496	482	奎屯		5	14
497	482	石河子		5	15
498	482	塔城		5	16
499	482	吐鲁番		5	17
500	482	伊宁		5	18
501	\N	西藏		6	28
502	501	拉萨		6	1
503	501	阿里		6	2
504	501	昌都		6	3
505	501	林芝		6	4
506	501	那曲		6	5
507	501	日喀则		6	6
508	501	山南		6	7
509	\N	云南		6	29
510	509	昆明		6	1
511	509	大理		6	2
512	509	保山		6	3
513	509	楚雄		6	4
514	509	大理		6	5
515	509	东川		6	6
516	509	个旧		6	7
517	509	景洪		6	8
518	509	开远		6	9
519	509	临沧		6	10
520	509	丽江		6	11
521	509	六库		6	12
522	509	潞西		6	13
523	509	曲靖		6	14
524	509	思茅		6	15
525	509	文山		6	16
526	509	西双版纳		6	17
527	509	玉溪		6	18
528	509	中甸		6	19
529	509	昭通		6	20
530	\N	香港		8	30
531	530	香港		8	1
532	530	九龙		8	2
533	530	新界		8	3
534	\N	澳门		8	31
535	534	澳门		8	1
536	\N	台湾		8	32
537	536	台北		8	1
538	536	基隆		8	2
539	536	台南		8	3
540	536	台中		8	4
541	536	高雄		8	5
542	536	屏东		8	6
543	536	南投		8	7
544	536	云林		8	8
545	536	新竹		8	9
546	536	彰化		8	10
547	536	苗栗		8	11
548	536	嘉义		8	12
549	536	花莲		8	13
550	536	桃园		8	14
551	536	宜兰		8	15
552	536	台东		8	16
553	536	金门		8	17
554	536	马祖		8	18
555	536	澎湖		8	19
556	\N	海外		9	33
557	556	美国		9	1
558	556	日本		9	2
559	556	英国		9	3
560	556	法国		9	4
561	556	德国		9	5
562	556	其他		9	6
\.


--
-- Data for Name: base_sncreater; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY base_sncreater (id, name, code, qz, qyrq, rqgs, dqxh, sfmrgx, ws, company_id, udate) FROM stdin;
L07e	盘点	STOCKCHECK	PD	1	yyyyMMdd	5	1	4	0001	20141016
L0c6	销售合同订单	ORDER2	XS	1	yyyyMMdd	13	1	4	0001	20141029
L0Pl	出库单	OUTSTOCK	CK	1	yyyyMMdd	39	1	4	0001	20141029
L0cJ	销售退货单	ORDER3	XST	1	yyyyMMdd	6	1	4	0001	20141029
L0Pa	入库单	INSTOCK	RK	1	yyyyMMdd	19	1	4	0001	20141029
L07o	出入库单	STORAGEBILL	CRK	1	yyyyMMdd	3	1	4	0001	20141008
L0wL	收款	FKSK1	SK	1	yyyyMMdd	29	1	4	0001	20141030
L0PW	调拨	STOCKALLOT	DB	1	yyyyMMdd	5	1	4	0001	20141008
L0Zw	产品编号	PRODUCT	CP	0	\N	2	0	4	0001	20141008
L0iN	应付款	YSYF0	YF	1	yyyyMMdd	1	1	4	0001	\N
L0oC	供应商	SUPPLIER	GYS	1	yyyyMMdd	3	0	4	0001	20140918
L0iX	应收款	YSYF1	YS	1	yyyyMMdd	1	1	4	0001	\N
L0w0	付款	FKSK0	FK	1	yyyyMMdd	10	1	4	0001	20141021
L0c2	采购合同订单	ORDER0	CG	1	yyyyMMdd	7	1	4	0001	20141022
L0qM	客户编号	CUSTOMER	KH	1	yyyyMMdd	24	1	4	0001	20141029
L0cS	采购退货	ORDER1	CGT	1	yyyyMMdd	3	1	4	0001	20141015
L0wH	报价单	ORDER4	BJ	1	yyyyMMdd	2	1	4	0001	20141015
\.


--
-- Data for Name: crm_business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_business (id, company_id, customer_id, head_id, name, origin, type, estimate_price, gain_rate, due_date, status, nextstep, nextstep_date, nextstep_time, contacts_id, contract_address, is_end, creater_id, create_datetime, updater_id, update_datetime, is_deleted, delete_id, delete_datetime) FROM stdin;
L0cU	0001	L0oe	00123	123112	L0K8	L0cR	1231231.00	12	\N	L0cK	dfsafsa	2014-09-04	\N	L0cG	\N	0	00123	2014-09-23 16:58:01	\N	\N	0	\N	\N
L0cX	0001	L0oR	00123	范德萨	L0Ki	L0ce	100.00	100	\N	L0cr	反倒萨芬	2014-09-16	\N	L0Zg	\N	0	00123	2014-09-24 17:13:17	\N	\N	0	\N	\N
L0P0	0001	L0oR	00123	范德萨	L0Ki	L0ce	100.00	100	\N	L0cr	反倒萨芬	2014-09-16	\N	L0Zg	\N	0	00123	2014-09-24 17:15:40	\N	\N	0	\N	\N
L0cs	0001	L0oR	00123	范德萨	L0Ki	L0ce	7180.00	100	\N	L0cr	反倒萨芬	2014-09-16	\N	L0Zg	\N	0	00123	2014-09-24 17:11:22	\N	\N	0	\N	\N
L0ca	0001	L0oR	00123	范德萨	L0Ki	L0ce	3246.00	100	\N	L0cr	反倒萨芬	2014-09-16	\N	L0Zg	\N	0	00123	2014-09-24 17:12:37	\N	\N	0	\N	\N
L0jA	0001	L0nU	L0nZ	asdf	L0K8	L0cR	2000.00	23	2014-10-31	L0cr	\N	\N	\N	L0n2	\N	0	L0nZ	2014-10-30 14:25:09	\N	\N	0	\N	\N
L0jk	0001	L0nU	L0nZ	fdsfds	L0K5	L0ce	4000.00	45	\N	L0c9	\N	\N	\N	L0n2	\N	0	L0nZ	2014-10-30 14:25:50	\N	\N	0	\N	\N
L0jU	0001	L0nU	L0nZ	dsaf	L0Kw	L0cR	3100.00	67	2014-10-31	L0c9	\N	\N	\N	L0n2	\N	0	L0nZ	2014-10-30 14:27:24	\N	\N	0	\N	\N
L0j6	0001	L0nU	L0nZ	jhg	L0K8	L0cR	76000.00	23	2014-10-31	L0cZ	\N	\N	\N	L0n2	\N	1	L0nZ	2014-10-30 14:30:45	\N	\N	0	\N	\N
\.


--
-- Data for Name: crm_business_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_business_data (id, remark, data) FROM stdin;
L0cU	fdsafsdaf	\N
L0cX	\N	\N
L0P0	\N	\N
L0cs	\N	\N
L0ca	\N	\N
L0jA	\N	\N
L0jk	\N	\N
L0jU	\N	\N
L0j6	\N	\N
\.


--
-- Data for Name: crm_campaigns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_campaigns (id, name, status, head_id, product_id, type, end_date, hearer, hearer_size, initiator_id, send_count, cost_budget, expect_reaction, expect_income, exp_sale_count, exp_rec_count, exp_rate_return, fact_cost, fact_sale_count, fact_rec_count, fact_rate_return, remark, company_id, creater_id, create_datetime, updater_id, update_datetime) FROM stdin;
L0iM	fdsad	0	L0Zz	\N	网上技术交流会	2014-10-11	fdsaf	234	\N	23	24234.00	一般	\N	\N	\N	\N	234.00	\N	\N	\N	fdfasd	0001	00123	2014-10-11 14:11:53	\N	\N
L0is	fdasdf	0	L0Zz	\N	会议	2014-10-11	fdas	23	\N	24	234234.00	无	234.00	23423	2342	23	23423.00	234	232	234	34235	0001	00123	2014-10-11 14:21:12	\N	2014-10-11 14:33:03
\.


--
-- Data for Name: crm_contact_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_contact_record (id, subject, concat_datetime, customer_id, contacts_id, concat_type, sale_stage, cust_status, business_id, content, create_datetime, creater_id, next_datetime, company_id) FROM stdin;
L0jx	自动生成0000000	2014-10-31	L0nU	L0n2	L0Kl	L0qG	L0qC	L0jU	范德萨富士达分	2014-10-31 13:37:33	L0nZ	\N	0001
L0jM	fdsaf	2014-11-03	L0oR	L0Zg	L0Ka	L0qG	L0q1	L0cs	fdsafsdafsdafsdaf	2014-11-03 11:32:26	00123	2014-11-11	0001
L0jE	fdsa	2014-11-03	L0oo	L0Z3	L0KT	L0qG	L0qC	L0cs	fdsafasdf	2014-11-03 11:34:10	00123	2014-11-17	0001
L0jv	=======	2014-11-05	L0oo	L0Z3	L0Kl	L0qh	L0qC	L0P0	fdafdsafdasfsa	2014-11-03 11:33:26	00123	2014-11-17	0001
\.


--
-- Data for Name: crm_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_contacts (id, customer_id, supplier_id, creater_id, name, post, department, sex, saltname, telephone, email, qq, address, zip_code, description, create_datetime, update_datetime, mobile, company_id, is_main, updater_id, idcard, type) FROM stdin;
L0cC	L0oe	\N	00123	123联系人	范德萨	四大房的萨芬范德萨	1	范德萨	 范德萨	反倒萨芬	范德萨	发达省份	\N	发大水	2014-09-22 12:06:30	\N	发达省份	0001	1	\N	\N	\N
L0cG	L0oe	\N	00123	123联系人	范德萨	四大房的萨芬范德萨	1	范德萨	 范德萨	反倒萨芬	范德萨	发达省份	\N	发大水	2014-09-22 12:06:30	\N	发达省份	0001	1	\N	\N	\N
L0cy	L0oe	\N	00123	123联系人	范德萨	四大房的萨芬范德萨	1	范德萨	 范德萨	反倒萨芬	范德萨	发达省份	\N	发大水	2014-09-22 12:06:30	\N	发达省份	0001	1	\N	\N	\N
L0Z3	L0oo	\N	00123	李四	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	2014-09-18 10:04:56	\N	\N	0001	1	\N	\N	3
L0Zo	L0oh	\N	00123	lisi	asf	fdas	1	fdsa	fdsa	fdsa	\N	fdsaf	\N	dfsafsdaf	2014-09-18 11:10:29	\N	fdsaf	0001	1	\N	\N	3
L0oN	L0o9	\N	00123	张三	11发到	采购部	1	张经理	0123	4234234@qq.com	234234	fsdafas	\N	fsdafsdafa	2014-09-17 14:55:33	2014-09-17 14:58:08	23423423	0001	1	00123	362422198708121234	\N
L0PY	L0Ze	\N	L0Zz	供应商联系人	放到撒	大水法	1	1	发到	放大	\N	范甘迪	\N	过分的是	2014-09-29 14:26:35	\N	放大	0001	1	\N	\N	0
L0Pf	L0Z9	\N	L0Zz	人员1	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	2014-09-29 14:35:39	\N	\N	0001	1	\N	\N	0
L0ZU	L0ZA	\N	L0Zz	ffdasfsa 	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	2014-09-18 15:15:24	\N	\N	0001	1	\N	\N	1
L0n2	L0nU	\N	L0nZ	李四	\N	\N	1	发	\N	\N	\N	\N	\N	\N	2014-10-29 09:55:43	\N	\N	0001	1	\N	\N	1
L0og	L0o9	\N	00123	张三	采购员	采购部	1	张经理	1231231	5345	5345345	345范德萨风格	\N	奋斗奋斗史	2014-09-17 11:36:37	2014-09-17 15:12:24	2234232343	0001	1	00123	\N	\N
L0Zg	L0oR	\N	L0Zz	sldi	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	2014-09-18 15:11:34	\N	\N	0001	1	\N	\N	1
L0ZN	L0oe	\N	00123	123联系人	范德萨	四大房的萨芬范德萨	1	范德萨	 范德萨	反倒萨芬	范德萨	发达省份	\N	发大水	2014-09-22 12:06:25	\N	发达省份	0001	1	\N	\N	\N
L0ZX	L0oe	\N	00123	123联系人	范德萨	四大房的萨芬范德萨	1	范德萨	 范德萨	反倒萨芬	范德萨	发达省份	\N	发大水	2014-09-22 12:06:28	\N	发达省份	0001	1	\N	\N	\N
L0c0	L0oe	\N	00123	123联系人	范德萨	四大房的萨芬范德萨	1	范德萨	 范德萨	反倒萨芬	范德萨	发达省份	\N	发大水	2014-09-22 12:06:28	\N	发达省份	0001	1	\N	\N	\N
L0cO	L0oe	\N	00123	123联系人	范德萨	四大房的萨芬范德萨	1	范德萨	 范德萨	反倒萨芬	范德萨	发达省份	\N	发大水	2014-09-22 12:06:30	\N	发达省份	0001	1	\N	\N	\N
\.


--
-- Data for Name: crm_contacts_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_contacts_data (id, remark) FROM stdin;
\.


--
-- Data for Name: crm_cust_rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_cust_rating (id, company_id, name, integral_start, integral_end, rate_star) FROM stdin;
L0qc	0001	一级	0	1000	1
L0qP	0001	二级	1000	3000	2
\.


--
-- Data for Name: crm_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_customer (id, company_id, type, head_id, creater_id, contacts_id, name, origin, address, zip_code, industry, ownership, rating, creator_id, create_datetime, updater_id, update_datetime, is_deleted, deleter_id, delete_datetime, province, province_name, city, city_name, area, area_name, email, fax, telephone, companyfc_id, sn, mobile, year_turnover, ent_cate, integral, staff_size, ent_stage, status, member_card, amt) FROM stdin;
L0o9	0001	2	L0Zz	00123	\N	张三个人	L0Kn	范德萨	\N	L0Kg	L0KD	L0qc	\N	2014-09-16 15:59:33	00123	2014-09-17 15:12:24	0	\N	\N	266	\N	281	\N	\N	\N	fdsa@12.com	010-12312312	010-12312312	\N	KH201409160016	13412341234	L0K6	L0qu	0	L0qk	L0qW	0	100093201	123456.22
L0oe	0001	2	L0Zz	00123	\N	12312312	L0Kn	范德萨	\N	\N	L0KD	L0qc	\N	2014-09-16 15:58:41	00123	2014-09-17 14:58:08	0	\N	\N	266	\N	276	\N	\N	\N	\N	\N	\N	\N	KH201409160014	\N	\N	\N	0	\N	\N	0	热舞亲热	0.00
L0oh	0001	3	L0Zz	00123	\N	wukong	L0Kz	\N	\N	L0Kj	L0KD	L0qP	\N	2014-09-16 15:51:01	00123	2014-09-16 22:50:34	0	\N	\N	1	\N	17	\N	\N	\N	sdafa@wem.com	010-12345678	010-12345678	\N	KH201409160013	\N	L0K2	L0qD	0	L0qk	L0qW	0	\N	0.00
L0Ze	0001	0	\N	00123	\N	供应商1	\N	fdsaf	\N	\N	L0KD	\N	\N	2014-09-18 10:41:58	\N	\N	0	\N	\N	345	\N	346	\N	\N	\N	loyinonline@126.com	010-12345678	010-12312312	\N	GYS201409180002	\N	L0K2	L0qu	0	L0qU	\N	0	\N	0.00
L0Z9	0001	0	\N	00123	\N	wukong	\N	\N	\N	\N	L0KI	\N	\N	2014-09-18 10:43:45	\N	\N	0	\N	\N	1	\N	3	\N	\N	\N	123123@12.com	\N	\N	\N	GYS201409180003	\N	L0K6	L0qu	0	L0qU	\N	0	\N	0.00
L0ZZ	0001	1	00123	00123	\N	客户123	L0K7	vdsadf	\N	L0Kj	L0Kt	L0qP	\N	2014-09-18 11:15:54	\N	\N	0	\N	\N	1	\N	3	\N	\N	\N	123123@sfdc.om	010-12312312	010-12312312	\N	KH201409180021	\N	L0KJ	L0qI	0	L0qJ	L0qQ	0	123123	0.00
L0oo	0001	3	L0Zz	00123	\N	范德萨法撒旦	L0Kz	范德萨	\N	\N	L0KY	L0qc	\N	2014-09-16 16:02:29	00123	2014-09-16 16:21:10	0	\N	\N	373	\N	375	\N	\N	\N	\N	\N	\N	\N	KH201409160019	\N	\N	\N	0	\N	\N	0	\N	0.00
L0oR	0001	2	L0Zz	00123	\N	六十多分	L0K5	\N	\N	\N	L0KI	L0qP	\N	2014-09-16 15:58:42	00123	2014-09-16 22:50:02	0	\N	\N	266	\N	276	\N	\N	\N	\N	\N	\N	\N	KH201409160015	\N	\N	\N	0	\N	\N	0	\N	0.00
L0ZA	0001	1	L0Zz	L0Zz	\N	wukon	L0Kz	\N	\N	L0Kg	L0KY	L0qc	\N	2014-09-18 15:15:24	\N	\N	0	\N	\N	266	\N	280	\N	\N	\N	\N	\N	\N	\N	KH201409180022	\N	L0K2	L0qu	0	L0q2	L0qW	0	\N	0.00
L0nU	0001	1	L0nZ	L0nZ	\N	客户1	L0K5	\N	\N	L0Kg	L0KD	L0qc	\N	2014-10-29 09:55:43	\N	\N	0	\N	\N	1	\N	2	\N	\N	\N	\N	\N	\N	\N	KH201410290024	\N	\N	\N	0	L0qU	\N	0	\N	0.00
\.


--
-- Data for Name: crm_customer_cares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_customer_cares (id, subject, care_datetime, contacts_id, customer_id, head_id, care_type, content, description, create_datetime, update_datetime, updater_id, company_id, creater_id) FROM stdin;
L0jB	fdas	2014-10-31	L0n2	L0nU	L0nZ	L0qL	fdasfsadfas	fdsafasd	2014-10-31 12:24:48	\N	\N	0001	L0nZ
\.


--
-- Data for Name: crm_customer_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_customer_data (id, remark, data) FROM stdin;
L0oe	反对撒发的是	\N
L0o9	反对撒发的是	\N
L0ZZ	vdsv	\N
L0oR	\N	\N
L0oo	反对撒发的是	\N
L0oh	苏打粉	\N
L0Z9	\N	\N
L0ZA	\N	\N
L0nU	\N	\N
\.


--
-- Data for Name: crm_customer_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_customer_record (id, customer_id, user_id, create_datetime, type) FROM stdin;
L0oZ	L0oo	00123	2014-09-16 16:02:57	0
239729	L0o9	00123	2014-09-17 13:42:50	2
239730	L0oR	00123	2014-09-17 13:42:50	2
239731	L0oe	00123	2014-09-17 13:42:50	2
239732	L0oh	00123	2014-09-17 13:42:50	2
239733	L0o9	00123	2014-09-17 13:44:00	2
239734	L0oR	00123	2014-09-17 13:44:00	2
239735	L0oe	00123	2014-09-17 13:44:00	2
239736	L0oh	00123	2014-09-17 13:44:00	2
239737	L0o9	00123	2014-09-17 13:50:46	2
239738	L0oR	00123	2014-09-17 13:50:46	2
239739	L0oe	00123	2014-09-17 13:50:46	2
239740	L0oh	00123	2014-09-17 13:50:46	2
239741	L0o9	00123	2014-09-17 13:53:57	2
239742	L0oR	00123	2014-09-17 13:53:57	2
239743	L0oe	00123	2014-09-17 13:53:57	2
239744	L0oh	00123	2014-09-17 13:53:57	2
239746	L0oo	00123	2014-09-17 14:03:40	1
239747	L0oe	00123	2014-09-17 14:04:06	2
239748	L0oh	00123	2014-09-17 14:04:06	2
239755	L0oo	00123	2014-09-17 15:01:15	1
239756	L0o9	00123	2014-09-17 15:01:15	1
239757	L0oR	00123	2014-09-17 15:01:15	1
L0Zc	L0ZZ	00123	2014-09-18 11:15:54	0
L0Zk	L0ZA	L0Zz	2014-09-18 15:15:24	0
239794	L0ZA	L0Zz	2014-09-18 15:19:23	2
239795	L0ZZ	L0Zz	2014-09-18 15:19:23	2
239796	L0oo	L0Zz	2014-09-18 15:19:23	2
239797	L0o9	L0Zz	2014-09-18 15:19:23	2
239798	L0oR	L0Zz	2014-09-18 15:19:23	2
239799	L0oe	L0Zz	2014-09-18 15:19:23	2
239800	L0oh	L0Zz	2014-09-18 15:19:23	2
239801	L0oo	L0Zz	2014-09-18 15:20:22	1
239904	L0ZA	L0Zz	2014-09-28 09:53:05	1
240085	L0ZZ	00123	2014-10-13 11:15:02	1
L0n6	L0nU	L0nZ	2014-10-29 09:55:43	0
\.


--
-- Data for Name: crm_email_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_email_template (id, subject, title, content, order_id, creater_id, updater_id) FROM stdin;
\.


--
-- Data for Name: crm_integral_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_integral_history (id, customer_id, gain, deplete, remark, create_datetime, order_id) FROM stdin;
\.


--
-- Data for Name: crm_leads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_leads (id, company_id, name, position_name, contacts_name, saltname, mobile, email, creater_id, create_datetime, update_datetime, is_deleted, delete_id, delete_datetime, is_transformed, transform_id, contacts_id, customer_id, business_id, nextstep, nextstep_date, address, customer_name, telephone, updater_id) FROM stdin;
L0c4	0001	fds 	\N	fdafasd	dfasda	dfafdsa	fdafdsa	00123	2014-09-22 15:10:11	\N	0	\N	\N	0	\N	\N	\N	\N	fdafa	2014-09-22	fdfdas	fdsa	fdasadfs	\N
L0cY	0001	fds 	\N	范德萨	\N	范德萨	反倒萨芬	00123	2014-09-23 22:49:59	\N	0	\N	\N	0	\N	\N	\N	\N	范德萨	2014-09-22	\N	 范德萨范德萨	范德萨	\N
L0cb	0001	fds 	\N	范德萨	\N	\N	\N	00123	2014-09-23 22:51:06	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	速读法	\N	\N
L0cf	0001	fds 	\N	范德萨	\N	\N	\N	00123	2014-09-23 22:51:07	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	速读法	\N	\N
L0cB	0001	fds 	\N	范德萨	\N	\N	\N	00123	2014-09-23 22:51:11	\N	0	\N	\N	0	\N	\N	\N	\N	\N	2014-09-23	\N	速读法	\N	\N
L0cx	0001	fds 	\N	范德萨	\N	范德萨	\N	00123	2014-09-23 22:51:17	\N	0	\N	\N	0	\N	\N	\N	\N	\N	2014-09-23	\N	速读法	\N	\N
L0cW	0001	fds 	\N	范德萨	\N	范德萨	\N	00123	2014-09-23 22:51:30	\N	0	\N	\N	0	\N	\N	\N	\N	\N	2014-09-23	\N	速读法	\N	\N
\.


--
-- Data for Name: crm_leads_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_leads_data (id, remark, data) FROM stdin;
L0c4	fasdfs	\N
L0cY	范德萨	\N
L0cW	范德萨	\N
\.


--
-- Data for Name: crm_recharge_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_recharge_record (id, amt, creater_id, create_datetime, customer_id) FROM stdin;
\.


--
-- Data for Name: crm_sms_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY crm_sms_template (id, subject, content, order_id, creater_id, updater_id) FROM stdin;
\.


--
-- Data for Name: em_mechanism; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY em_mechanism (id, company_id, name, content, start_date, end_date, create_datetime, creater_id, status, type) FROM stdin;
\.


--
-- Data for Name: em_salegoal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY em_salegoal (id, company_id, creater_id, user_id, team_id, department_id, name, status, year, y, q1, q2, q3, q4, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, mv1, mv2, mv3, mv4, mv5, mv6, mv7, mv8, mv9, mv10, mv11, mv12, qv1, qv2, qv3, qv4, yv) FROM stdin;
L0n5	0001	00123	00123	\N	\N	\N	1	2014	2400000.00	600000.00	600000.00	600000.00	600000.00	200000.00	200000.00	200000.00	200000.00	200000.00	200000.00	200000.00	200000.00	200000.00	200000.00	200000.00	200000.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
L0nA	0001	L0nZ	L0nZ	\N	\N	\N	1	2014	240000.00	60000.00	60000.00	60000.00	60000.00	20000.00	20000.00	20000.00	20000.00	20000.00	20000.00	20000.00	20000.00	20000.00	20000.00	20000.00	20000.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	14300.00	0.00	0.00	0.00	0.00	0.00	14300.00	14300.00
L0js	0001	L0nZ	L0nZ	\N	\N	\N	1	2015	120000.00	30000.00	30000.00	30000.00	30000.00	10000.00	10000.00	10000.00	10000.00	10000.00	10000.00	10000.00	10000.00	10000.00	10000.00	10000.00	10000.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- Data for Name: em_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY em_team (id, company_id, head_id, name, description, status) FROM stdin;
\.


--
-- Data for Name: em_team_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY em_team_user (team_id, user_id) FROM stdin;
\.


--
-- Data for Name: fa_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fa_account (id, company_id, name, account, bankname, amt, yh, status, khmc) FROM stdin;
L0i6	0001	财付通	cnlentis-tenpay@cnlentis.com	\N	2774.70	2	1	\N
L0ed	0001	现金账户	现金	\N	25415.81	0	1	\N
L0qF	0001	支付宝	cnlentis-alipay@cnlentis.com	北京银行	2309657.71	2	1	北京银行
\.


--
-- Data for Name: fa_account_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fa_account_detail (id, amt_in, amt_out, remark, creater_id, create_datetime, account_id, balance, ordersn, relation_id) FROM stdin;
L0zC	500.00	\N	订单:XS201410220009-应收款-收款	00123	2014-10-22 11:57:44	L0qF	2309657.71	\N	L0oR
L0ju	0.00	200.00	订单:XST201410290006-应收款-收款	L0zM	2014-10-30 15:00:55	L0i6	2774.70	\N	L0nU
\.


--
-- Data for Name: fa_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fa_invoice (id, company_id, order_id, order_billsn, kpnr, head_id, type, fpsn, amt, kprq, remark, creater_id, create_datetime, pjlx) FROM stdin;
L0Zv	0001	\N	fdsafsdaf	sdfa	fdsaf	0	12478980	2389.00	2014-09-01	fdsafdsf	00123	2014-09-22 09:21:35	0
L0Rb	0001	\N	范德萨	范德萨	00123	1	12342343	23423.00	2014-09-01	范德萨法撒旦	00123	2014-09-10 11:48:04	1
L0Zl	0001	\N	fdsaf	fdsa	L0Zz	1	fdsaf	0.00	2014-09-10	fdsafdsf	00123	2014-09-22 11:17:00	1
L0jT	0001	\N	132113	123098797	L0zM	0	fdsa	1000.00	2014-11-04	fdsa	00123	2014-11-04 11:50:39	0
\.


--
-- Data for Name: fa_pay_receiv_ables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fa_pay_receiv_ables (id, company_id, type, customer_id, order_id, name, amt, head_id, description, creater_id, pay_datetime, create_datetime, status, update_datetime, is_deleted, deleter_id, delete_datetime, pay_amt, qc, qc_date, is_transfer) FROM stdin;
L0jK	0001	1	L0nU	L0nx	订单:XS201410290012-应收款	1500.00	L0nZ	\N	L0nZ	\N	2014-10-29 10:52:41	0	\N	0	\N	\N	0.00	0	\N	0
L0jP	0001	1	L0nU	L0jc	订单:XS201410290013-应收款	3000.00	L0nZ	\N	L0nZ	\N	2014-10-29 10:55:45	0	\N	0	\N	\N	0.00	0	\N	0
L0j5	0001	1	L0nU	L0ji	订单:XST201410290006-应收款	-200.00	L0nZ	\N	L0nZ	2014-10-30 15:00:55	2014-10-29 11:06:06	2	\N	0	\N	\N	-200.00	0	\N	0
L0zL	0001	1	L0oR	L05N	订单:XS201410220009-应收款	1500.00	00123	\N	00123	2014-10-22 11:57:44	2014-10-22 11:48:16	1	\N	0	\N	\N	500.00	0	\N	0
L0zy	0001	1	L0oR	L0zG	订单:XST201410220005-应收款	-100.00	00123	\N	00123	\N	2014-10-22 12:00:43	0	\N	0	\N	\N	0.00	0	\N	0
L0zm	0001	0	L0Ze	L0zV	订单:CG201410220007-应付款	1000.00	00123	\N	00123	\N	2014-10-22 12:12:05	0	\N	0	\N	\N	0.00	0	\N	0
L0nI	0001	1	L0nU	L0nS	订单:XS201410290010-应收款	10000.00	L0nZ	\N	L0nZ	\N	2014-10-29 10:06:03	0	\N	0	\N	\N	0.00	0	\N	0
L0nb	0001	1	L0nU	L0nt	订单:XS201410290011-应收款	10000.00	L0nZ	\N	L0nZ	\N	2014-10-29 10:20:08	0	\N	0	\N	\N	0.00	0	\N	0
\.


--
-- Data for Name: fa_pay_receiv_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fa_pay_receiv_order (id, company_id, name, amt, payables_id, description, pay_datetime, head_id, status, audit_datetime, creater_id, create_datetime, subject_id, account_id, billsn, type, updater_id, update_datetime, deleter_id, is_deleted, delete_datetime, customer_id, ables_name, is_end) FROM stdin;
L0zO	0001	订单:XS201410220009-应收款-收款	500.00	L0zL	\N	2014-10-22	00123	1	\N	00123	2014-10-22 11:57:44	1122	L0qF	SK201410220028	1	\N	\N	\N	0	\N	L0oR	订单:XS201410220009-应收款	1
L0jJ	0001	订单:XST201410290006-应收款-收款	-200.00	L0j5	dsa	2014-10-30	L0nZ	1	\N	L0zM	2014-10-30 15:00:55	1122	L0i6	SK201410300029	1	\N	\N	\N	0	\N	L0nU	订单:XST201410290006-应收款	1
\.


--
-- Data for Name: fa_subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fa_subject (id, parent_id, company_id, code, name, type, category, level, direction) FROM stdin;
1001		0001	1001	库存现金	0	0	1	0
1002		0001	1002	银行存款	0	0	1	0
100201	1002	0001	100201	招行科技园支行	0	0	1	0
100202	1002	0001	100202	工行高新支行	0	0	1	0
100203	1002	0001	100203	农行港币户	0	0	1	0
1012		0001	1012	其他货币资金	0	0	1	0
1101		0001	1101	短期投资	0	0	1	0
110101	1101	0001	110101	股票	0	0	1	0
110102	1101	0001	110102	债券	0	0	1	0
110103	1101	0001	110103	基金	0	0	1	0
110110	1101	0001	110110	其他	0	0	1	0
1121		0001	1121	应收票据	0	0	1	0
1122		0001	1122	应收账款	0	0	1	0
1123		0001	1123	预付账款	0	0	1	0
1131		0001	1131	应收股利	0	0	1	0
1132		0001	1132	应收利息	0	0	1	0
1221		0001	1221	其他应收款	0	0	1	0
1401		0001	1401	材料采购	0	0	1	0
1402		0001	1402	在途物资	0	0	1	0
1403		0001	1403	原材料	0	0	1	0
1404		0001	1404	材料成本差异	0	0	1	0
1405		0001	1405	库存商品	0	0	1	0
1407		0001	1407	商品进销差价	0	0	1	0
1408		0001	1408	委托加工物资	0	0	1	0
1411		0001	1411	周转材料	0	0	1	0
1421		0001	1421	消耗性生物资产	0	0	1	0
1501		0001	1501	长期债券投资	0	1	1	0
150101	1501	0001	150101	债券投资	0	1	1	0
150102	1501	0001	150102	其他债权投资	0	1	1	0
1511		0001	1511	长期股权投资	0	1	1	0
151101	1511	0001	151101	股票投资	0	1	1	0
151102	1511	0001	151102	其他股权投资	0	1	1	0
1601		0001	1601	固定资产	0	1	1	0
1602		0001	1602	累计折旧	0	1	1	1
1604		0001	1604	在建工程	0	1	1	0
160401	1604	0001	160401	建筑工程	0	1	1	0
160402	1604	0001	160402	安装工程	0	1	1	0
160403	1604	0001	160403	技术改造工程	0	1	1	0
160404	1604	0001	160404	其他支出	0	1	1	0
1605		0001	1605	工程物资	0	1	1	0
1606		0001	1606	固定资产清理	0	1	1	0
1621		0001	1621	生产性生物资产	0	1	1	0
1622		0001	1622	生产性生物资产累计折旧	0	1	1	1
1701		0001	1701	无形资产	0	1	1	0
1702		0001	1702	累计摊销	0	1	1	1
1801		0001	1801	长期待摊费用	0	1	1	0
1901		0001	1901	待处理财产损溢	0	1	1	0
2001		0001	2001	短期0款	1	2	1	1
2201		0001	2201	应付票据	1	2	1	1
2202		0001	2202	应付账款	1	2	1	1
2203		0001	2203	预收账款	1	2	1	1
2211		0001	2211	应付职工薪酬	1	2	1	1
2221		0001	2221	应交税费	1	2	1	1
222101	2221	0001	222101	应交增值税	1	2	1	1
22210101	222101	0001	22210101	进项税额	1	2	1	0
22210102	222101	0001	22210102	已交税金	1	2	1	0
22210103	222101	0001	22210103	减免税款	1	2	1	0
22210104	222101	0001	22210104	出口抵减内销产品应纳税额	1	2	1	0
22210105	222101	0001	22210105	转出未交增值税	1	2	1	0
22210106	222101	0001	22210106	销项税额	1	2	1	1
22210107	222101	0001	22210107	出口退税	1	2	1	1
22210108	222101	0001	22210108	进项税额转出	1	2	1	1
22210109	222101	0001	22210109	转出多交增值税	1	2	1	1
222102	2221	0001	222102	未交增值税	1	2	1	1
222103	2221	0001	222103	应交营业税	1	2	1	1
222104	2221	0001	222104	应交消费税	1	2	1	1
222105	2221	0001	222105	应交资源税	1	2	1	1
222106	2221	0001	222106	应交所得税	1	2	1	1
222107	2221	0001	222107	应交土地增值税	1	2	1	1
222108	2221	0001	222108	应交城市维护建设税	1	2	1	1
222109	2221	0001	222109	应交房产税	1	2	1	1
222110	2221	0001	222110	应交土地使用税	1	2	1	1
222111	2221	0001	222111	应交车船使用税	1	2	1	1
222112	2221	0001	222112	应交个人所得税	1	2	1	1
222113	2221	0001	222113	教育费附加	1	2	1	1
2231		0001	2231	应付利息	1	2	1	1
2232		0001	2232	应付利润	1	2	1	1
2241		0001	2241	其他应付款	1	2	1	1
2401		0001	2401	递延收益	1	2	1	1
2501		0001	2501	长期0款	1	2	1	1
2701		0001	2701	长期应付款	1	2	1	1
3001		0001	3001	实收资本	2	4	1	1
3002		0001	3002	资本公积	2	4	1	1
300201	3002	0001	300201	资本溢价	2	4	1	1
300202	3002	0001	300202	接受捐赠非现金资产准备	2	4	1	1
300206	3002	0001	300206	外币资本折算差额	2	4	1	1
300207	3002	0001	300207	其他资本公积	2	4	1	1
3101		0001	3101	盈余公积	2	4	1	1
310101	3101	0001	310101	法定盈余公积	2	4	1	1
310102	3101	0001	310102	任意盈余公积	2	4	1	1
310103	3101	0001	310103	法定公益金	2	4	1	1
3103		0001	3103	本年利润	2	4	1	1
3104		0001	3104	利润分配	2	4	1	1
310401	3104	0001	310401	其他转入	2	4	1	0
310402	3104	0001	310402	提取法定盈余公积	2	4	1	0
310403	3104	0001	310403	提取法定公益金	2	4	1	0
310409	3104	0001	310409	提取任意盈余公积	2	4	1	0
310410	3104	0001	310410	应付利润	2	4	1	0
310411	3104	0001	310411	转作资本的利润	2	4	1	0
310415	3104	0001	310415	未分配利润	2	4	1	1
4001		0001	4001	生产成本	3	5	1	0
400101	4001	0001	400101	基本生产成本	3	5	1	0
400102	4001	0001	400102	辅助生产成本	3	5	1	0
4101		0001	4101	制造费用	3	5	1	0
4301		0001	4301	研发支出	3	5	1	0
4401		0001	4401	工程施工	3	5	1	0
4403		0001	4403	机械作业	3	5	1	0
5001		0001	5001	主营业务收入	4	6	1	1
5051		0001	5051	其他业务收入	4	7	1	1
5111		0001	5111	投资收益	4	7	1	1
5301		0001	5301	营业外收入	4	7	1	1
530101	5301	0001	530101	非流动资产处置净收益	4	7	1	1
530102	5301	0001	530102	政府补助	4	7	1	1
530103	5301	0001	530103	捐赠收益	4	7	1	1
530104	5301	0001	530104	盘盈收益	4	7	1	1
530105	5301	0001	530105	其他	4	7	1	1
5401		0001	5401	主营业务成本	4	11	1	0
5402		0001	5402	其他业务成本	4	10	1	0
5403		0001	5403	营业税金及附加	4	10	1	0
540301	5403	0001	540301	消费税	4	10	1	0
540302	5403	0001	540302	营业税	4	10	1	0
540303	5403	0001	540303	城市维护建设税	4	10	1	0
540304	5403	0001	540304	资源税	4	10	1	0
540305	5403	0001	540305	土地增值税	4	10	1	0
540306	5403	0001	540306	城镇土地使用税	4	10	1	0
540307	5403	0001	540307	房产税	4	10	1	0
540308	5403	0001	540308	车船税	4	10	1	0
540309	5403	0001	540309	印花税	4	10	1	0
540310	5403	0001	540310	教育费附加	4	10	1	0
540311	5403	0001	540311	矿产资源补偿费	4	10	1	0
540312	5403	0001	540312	排污费	4	10	1	0
5601		0001	5601	销售费用	4	9	1	0
560101	5601	0001	560101	办公用品	4	9	1	0
560102	5601	0001	560102	房租	4	9	1	0
560103	5601	0001	560103	物业管理费	4	9	1	0
560104	5601	0001	560104	水电费	4	9	1	0
560105	5601	0001	560105	交际应酬费	4	9	1	0
560106	5601	0001	560106	市内交通费	4	9	1	0
560107	5601	0001	560107	差旅费	4	9	1	0
560108	5601	0001	560108	补助	4	9	1	0
560109	5601	0001	560109	通讯费	4	9	1	0
560110	5601	0001	560110	工资	4	9	1	0
560111	5601	0001	560111	佣金	4	9	1	0
560112	5601	0001	560112	保险金	4	9	1	0
560113	5601	0001	560113	福利费	4	9	1	0
560114	5601	0001	560114	累计折旧	4	9	1	0
560115	5601	0001	560115	商品维修费	4	9	1	0
560116	5601	0001	560116	广告和业务宣传费	4	9	1	0
560199	5601	0001	560199	其他	4	9	1	0
5602		0001	5602	管理费用	4	9	1	0
560201	5602	0001	560201	办公用品	4	9	1	0
560202	5602	0001	560202	房租	4	9	1	0
560203	5602	0001	560203	物业管理费	4	9	1	0
560204	5602	0001	560204	水电费	4	9	1	0
560205	5602	0001	560205	交际应酬费	4	9	1	0
560206	5602	0001	560206	市内交通费	4	9	1	0
560207	5602	0001	560207	差旅费	4	9	1	0
560208	5602	0001	560208	通讯费	4	9	1	0
560209	5602	0001	560209	工资	4	9	1	0
560210	5602	0001	560210	保险金	4	9	1	0
560211	5602	0001	560211	福利费	4	9	1	0
560212	5602	0001	560212	累计折旧	4	9	1	0
560213	5602	0001	560213	开办费	4	9	1	0
560214	5602	0001	560214	职工教育经费	4	9	1	0
560215	5602	0001	560215	研究费用	4	9	1	0
560299	5602	0001	560299	其他	4	9	1	0
5603		0001	5603	财务费用	4	9	1	0
560301	5603	0001	560301	汇兑损益	4	9	1	0
560302	5603	0001	560302	利息	4	9	1	0
560303	5603	0001	560303	手续费	4	9	1	0
560399	5603	0001	560399	其他	4	9	1	0
5711		0001	5711	营业外支出	4	10	1	0
571101	5711	0001	571101	存货盘亏毁损	4	10	1	0
571102	5711	0001	571102	非流动资产处置净损失	4	10	1	0
571103	5711	0001	571103	坏账损失	4	10	1	0
571104	5711	0001	571104	无法收回的长期债券投资损失	4	10	1	0
571105	5711	0001	571105	无法收回的长期股权投资损失	4	10	1	0
571106	5711	0001	571106	自然灾害等不可抗力造成的损失	4	10	1	0
571107	5711	0001	571107	税收滞纳金	4	10	1	0
571108	5711	0001	571108	罚金、罚款	4	10	1	0
571109	5711	0001	571109	捐赠支出	4	10	1	0
571110	5711	0001	571110	其他	4	10	1	0
5801		0001	5801	所得税费用	4	10	1	0
6000		0001	6000	以前年度损益调整	4	10	1	0
\.


--
-- Data for Name: hr_assessment_kpi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hr_assessment_kpi (id, model_id, name) FROM stdin;
\.


--
-- Data for Name: hr_assessment_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hr_assessment_model (id, name, content, postion_id) FROM stdin;
\.


--
-- Data for Name: hr_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hr_employee (id) FROM stdin;
\.


--
-- Data for Name: hr_pact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hr_pact (id, employee_id) FROM stdin;
\.


--
-- Data for Name: hr_salary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hr_salary (id, employee_id) FROM stdin;
\.


--
-- Name: id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_seq', 240435, true);


--
-- Data for Name: oa_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oa_comment (id, creator_role_id, relation_id, content, create_datetime) FROM stdin;
\.


--
-- Data for Name: oa_dream_board; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oa_dream_board (id, company_id, user_id, content, create_datetime) FROM stdin;
\.


--
-- Data for Name: oa_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oa_file (id, name, creater_id, file_path, create_datetime, fsize, save_path, relation_id) FROM stdin;
\.


--
-- Data for Name: oa_knowledge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oa_knowledge (id, user_id, category_id, title, content, create_datetime, update_datetime, hits, color) FROM stdin;
\.


--
-- Data for Name: oa_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oa_message (id, to_user_id, from_user_id, content, send_datetime, is_read, typ) FROM stdin;
\.


--
-- Data for Name: oa_notice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oa_notice (id, user_id, category_id, title, content, create_datetime, update_datetime, status, isshow) FROM stdin;
\.


--
-- Data for Name: oa_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oa_task (id, owner_id, subject, due_datetime, status, priority, send_email, description, creater_id, create_datetime, isclose, is_deleted) FROM stdin;
\.


--
-- Data for Name: oa_topic_rep; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oa_topic_rep (id, topic_id, rep_id, content, create_datetime, zan) FROM stdin;
\.


--
-- Data for Name: oa_workreport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oa_workreport (id, user_id, create_datetime, update_datetime, subject, content, type, report_date, temp_id, is_submit) FROM stdin;
\.


--
-- Data for Name: oa_workreporttemp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oa_workreporttemp (id, name, content, type, postion_id, company_id) FROM stdin;
\.


--
-- Data for Name: os_topic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY os_topic (id, subject, content, create_datetime, creater_id, category_id, zan) FROM stdin;
\.


--
-- Data for Name: scm_bizcompetitor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_bizcompetitor (competitor_id, business_id, remark) FROM stdin;
\.


--
-- Data for Name: scm_competitor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_competitor (id, company_id, name, qyxz, ppzmd, sczy, ppxz, jzwx, remark, creater_id, create_datetime, updater_id, update_datetime, delete_id, delete_datetime, is_deleted) FROM stdin;
L0ZW	0001	sadfs	L0qD	高	20	\N	低	fdsa\n	00123	2014-09-19 10:42:08	\N	\N	\N	\N	\N
\.


--
-- Data for Name: scm_depot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_depot (id, name, company_id, remark) FROM stdin;
L0Km	北京仓库	0001	bafsdafs
L0K3	北京仓库1	0001	\N
\.


--
-- Data for Name: scm_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_order (id, ordertype, customer_id, business_id, billsn, rebate, rebate_amt, order_amt, sign_date, head_id, audit_status, pay_status, start_date, end_date, create_datetime, creater_id, submit_status, is_deleted, deleter_id, delete_datetime, updater_id, update_datetime, company_id, delivery_date, auditor_id, audit_datetime, ordersn, pay_datetime) FROM stdin;
L0jc	2	L0nU	\N	XS201410290013	0	0.00	3000.00	2014-10-29	L0nZ	2	0	\N	\N	2014-10-29 10:55:35	L0nZ	1	0	\N	\N	\N	\N	0001	2014-10-29	\N	\N	\N	\N
L0nx	2	L0nU	\N	XS201410290012	0	0.00	1500.00	2014-10-29	L0nZ	2	0	\N	\N	2014-10-29 10:32:20	L0nZ	1	0	\N	\N	\N	\N	0001	2014-10-29	\N	\N	\N	\N
L0nt	2	L0nU	\N	XS201410290011	0	0.00	10000.00	2014-10-29	L0nZ	2	0	\N	\N	2014-10-29 10:19:56	L0nZ	1	0	\N	\N	\N	\N	0001	2014-10-29	\N	\N	\N	\N
L0nS	2	L0nU	\N	XS201410290010	0	0.00	10000.00	2014-10-29	L0nZ	2	0	2014-10-01	2015-10-31	2014-10-29 10:04:49	L0nZ	1	0	\N	\N	\N	\N	0001	2014-10-29	\N	\N	\N	\N
L0ji	3	L0nU	\N	XST201410290006	0	0.00	200.00	2014-10-29	L0nZ	2	2	\N	\N	2014-10-29 11:04:35	L0nZ	1	0	\N	\N	\N	\N	0001	2014-10-29	\N	\N	XS201410290013	2014-10-30 15:00:55
L05N	2	L0oR	\N	XS201410220009	0	0.00	1500.00	2014-10-22	00123	2	1	2014-10-01	2014-10-22	2014-10-22 11:43:48	00123	1	0	\N	\N	00123	2014-10-22 11:46:17	0001	2014-10-22	\N	\N	\N	2014-10-22 11:57:44
L0zG	3	L0oR	\N	XST201410220005	33.332999999999998	50.00	100.00	2014-10-22	00123	2	0	\N	\N	2014-10-22 11:59:32	00123	1	0	\N	\N	\N	\N	0001	2014-10-22	\N	\N	XS201410220009	\N
L0zV	0	L0Ze	\N	CG201410220007	0	0.00	1000.00	2014-10-22	00123	2	0	\N	\N	2014-10-22 12:11:54	00123	1	0	\N	\N	\N	\N	0001	2014-10-22	\N	\N	\N	\N
\.


--
-- Data for Name: scm_order_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_order_data (id, remark, pact, data) FROM stdin;
L05N	fdsafsda	\N	\N
L0zG	\N	\N	\N
L0zV	\N	<p>fdsafdsafsdafsdfsdaf</p>	\N
L0nS	\N	<p>倒萨发顺丰</p><p>发达省份打算分</p><p>范德萨范德萨</p><p><br/></p>	\N
L0nt	\N	<p>发达省份的</p>	\N
L0nx	\N	\N	\N
L0jc	\N	\N	\N
L0ji	\N	\N	\N
\.


--
-- Data for Name: scm_order_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_order_product (id, product_id, purchase_price, sale_price, amount, zkl, zhamt, amt, description, quoted_price, tax_rate, tax) FROM stdin;
L05N	L0P1	100.00	150.00	10	0	0.00	1500.00		0.00	0	0.00
L0zG	L0P1	100.00	150.00	1	0	0.00	150.00		0.00	0	0.00
L0zV	L076	1000.00	1000.00	1	0	0.00	1000.00		0.00	0	0.00
L0nS	L0m9	150.00	200.00	50	0	0.00	10000.00		0.00	0	0.00
L0nt	L0m9	150.00	200.00	50	0	0.00	10000.00		0.00	0	0.00
L0nx	L076	1000.00	1500.00	1	0	0.00	1500.00		0.00	0	0.00
L0jc	L076	1000.00	1500.00	2	0	0.00	3000.00		0.00	0	0.00
L0ji	L0m9	150.00	200.00	1	0	0.00	200.00		0.00	0	0.00
L0jA	L0P1	\N	150.00	10	\N	\N	\N		200.00	\N	\N
L0jk	L076	\N	1500.00	2	\N	\N	\N		2000.00	\N	\N
L0jU	L0P1	\N	150.00	2	\N	\N	\N		300.00	\N	\N
L0jU	L0m9	\N	200.00	10	\N	\N	\N		250.00	\N	\N
L0j6	L076	\N	1500.00	10	\N	\N	\N		3000.00	\N	\N
L0j6	L0m9	\N	200.00	200	\N	\N	\N		230.00	\N	\N
\.


--
-- Data for Name: scm_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_product (id, company_id, billsn, name, unit, sale_price, purchase_price, category, status, model, remark, stock_warn) FROM stdin;
L0P1	0001	SD-100AH12V	山顿100安时12伏特	L0Vz	150.00	100.00	L0qi	1	SD-100AH12V	fdasf	20
L0m9	0001	SXF-VPN-001	深信服VPN	L0dI	200.00	150.00	L0Hy	1	SXF-VPN100	fasdasfsd	10
L076	0001	CP0002	防火墙A型	L0Vz	1500.00	1000.00	L0P2	1	FIREWAL	范德萨	0
\.


--
-- Data for Name: scm_product_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_product_price (id, product_id, cost, amount, price, start_date, end_date) FROM stdin;
L04Y	L0P1	100.00	150	10.00	2014-09-01	2014-09-23
L04Y	L0m9	200.00	250	100.00	2014-09-01	2014-09-23
L04Y	L0m9	200.00	200	200.00	2014-09-01	2014-09-23
\.


--
-- Data for Name: scm_product_price_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_product_price_order (id, company_id, subject, start_date, end_date, creater_id, create_datetime, remark, submit_status) FROM stdin;
L04Y	0001	2014年9月份价目表	2014-09-01	2014-09-23	00123	2014-09-09 15:32:36	\N	0
\.


--
-- Data for Name: scm_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_stock (product_id, depot_id, amount, cost, lock_amount, onway_amount) FROM stdin;
L0P1	L0K3	12015	\N	0	0
L0m9	L0K3	15	\N	0	0
L0m9	L0Km	70	\N	0	0
L0P1	L0Km	45	\N	0	0
L076	L0Km	3	\N	0	0
\.


--
-- Data for Name: scm_stock_allot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_stock_allot (id, company_id, billsn, head_id, bill_date, remark, submit_status, creater_id, create_datetime, updater_id, update_datetime, delete_datetime, deleter_id, is_deleted, to_depot_id, out_depot_id) FROM stdin;
L0Pv	0001	DB201409300003	L0Zz	2014-09-30	fdsafdsa	1	L0Zz	2014-09-30 09:29:09	\N	\N	\N	\N	0	L0K3	L0Km
L0PM	0001	DB201409290002	L0Kq	2014-09-01	范德萨	1	L0Zz	2014-09-29 17:17:35	\N	\N	\N	\N	0	L0K3	L0Km
L07z	0001	DB201410080004	L0Kq	2014-10-08	\N	1	00123	2014-10-08 11:23:58	\N	\N	\N	\N	0	L0K3	L0Km
L07g	0001	DB201410080005	00123	2014-10-08	范德萨发达省份	1	00123	2014-10-08 11:38:08	\N	\N	\N	\N	0	L0K3	L0Km
\.


--
-- Data for Name: scm_stock_allot_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_stock_allot_list (id, product_id, amount) FROM stdin;
L0PM	L0m9	20
L0Pv	L0P1	23
L07z	L0P1	3
L07z	L0m9	1
L07g	L0P1	12
L07g	L0m9	2
\.


--
-- Data for Name: scm_stock_check; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_stock_check (id, creater_id, create_datetime, remark, head_id, bill_date, billsn, company_id, submit_status, depot_id, updater_id, update_datetime, deleter_id, delete_datetime, is_deleted) FROM stdin;
L079	L0Zz	2014-09-30 11:54:35	fdsafdas	00123	2014-09-02	PD201409300002	0001	1	L0Km	\N	\N	\N	\N	0
L07R	L0Zz	2014-09-30 11:47:21	fdsafdas	00123	2014-09-02	PD201409300001	0001	1	L0K3	\N	\N	\N	\N	0
L07K	L0Zz	2014-09-30 12:00:53	fdsaf	00123	2014-09-02	PD201409300003	0001	1	L0K3	\N	\N	\N	\N	0
L07U	00123	2014-10-08 11:49:56	发达省份	00123	2014-10-08	PD201410080004	0001	1	L0Km	\N	\N	\N	\N	0
L08M	00123	2014-10-16 11:56:50	放大	00123	2014-10-16	PD201410160005	0001	1	L0Km	\N	\N	\N	\N	0
\.


--
-- Data for Name: scm_stock_check_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_stock_check_list (id, product_id, amount, amount2) FROM stdin;
L079	L0m9	0	35
L079	L0P1	0	10
L07K	L0P1	2	10
L07U	L0P1	27	25
L07U	L0m9	75	70
L08M	L076	3	15
\.


--
-- Data for Name: scm_storage_bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_storage_bill (id, company_id, billsn, depot_id, bill_date, head_id, attn, remark, order_id, type, status, creater_id, create_datetime, delete_datetime, deleter_id, is_deleted, updater_id, update_datetime, ordersn) FROM stdin;
L0z1	0001	CK201410220023	\N	2014-10-22	\N	\N	\N	L05N	4	0	0	2014-10-22 11:48:16	\N	\N	0	\N	\N	XS201410220009
L0zp	0001	RK201410220016	\N	2014-10-22	\N	\N	\N	L0zG	1	0	0	2014-10-22 12:00:43	\N	\N	0	\N	\N	XST201410220005
L0z3	0001	RK201410220017	L0Km	2014-10-22	L0Kq	\N	\N	L0zV	0	1	0	2014-10-22 12:12:05	\N	\N	0	\N	\N	CG201410220007
L0nu	0001	CK201410290024	\N	2014-10-29	\N	\N	\N	L0nS	4	0	0	2014-10-29 10:05:20	\N	\N	0	\N	\N	XS201410290010
L0nY	0001	CK201410290025	\N	2014-10-29	\N	\N	\N	L0nS	4	0	0	2014-10-29 10:06:03	\N	\N	0	\N	\N	XS201410290010
L0nf	0001	CK201410290026	\N	2014-10-29	\N	\N	\N	L0nt	4	0	0	2014-10-29 10:20:08	\N	\N	0	\N	\N	XS201410290011
L0nQ	0001	CK201410290027	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:32:28	\N	\N	0	\N	\N	XS201410290012
L0nv	0001	CK201410290028	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:33:34	\N	\N	0	\N	\N	XS201410290012
L0ns	0001	CK201410290029	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:34:47	\N	\N	0	\N	\N	XS201410290012
L0nN	0001	CK201410290030	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:35:24	\N	\N	0	\N	\N	XS201410290012
L0jL	0001	CK201410290031	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:36:52	\N	\N	0	\N	\N	XS201410290012
L0jC	0001	CK201410290032	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:37:22	\N	\N	0	\N	\N	XS201410290012
L0jp	0001	CK201410290033	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:38:16	\N	\N	0	\N	\N	XS201410290012
L0jV	0001	CK201410290034	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:40:59	\N	\N	0	\N	\N	XS201410290012
L0j4	0001	CK201410290035	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:45:20	\N	\N	0	\N	\N	XS201410290012
L0je	0001	CK201410290036	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:50:04	\N	\N	0	\N	\N	XS201410290012
L0j9	0001	CK201410290037	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:51:39	\N	\N	0	\N	\N	XS201410290012
L0jq	0001	CK201410290038	\N	2014-10-29	\N	\N	\N	L0nx	4	0	0	2014-10-29 10:52:41	\N	\N	0	\N	\N	XS201410290012
L0j7	0001	CK201410290039	\N	2014-10-29	\N	\N	\N	L0jc	4	0	0	2014-10-29 10:55:45	\N	\N	0	\N	\N	XS201410290013
L0j8	0001	RK201410290018	\N	2014-10-29	\N	\N	\N	L0ji	1	0	0	2014-10-29 11:04:50	\N	\N	0	\N	\N	XST201410290006
L0jz	0001	RK201410290019	\N	2014-10-29	\N	\N	\N	L0ji	1	0	0	2014-10-29 11:06:06	\N	\N	0	\N	\N	XST201410290006
\.


--
-- Data for Name: scm_storage_bill_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scm_storage_bill_list (id, product_id, amount, remark, balance) FROM stdin;
L0z1	L0P1	10	\N	\N
L0zp	L0P1	1	\N	\N
L0z3	L076	1		3
L0nu	L0m9	50	\N	\N
L0nY	L0m9	50	\N	\N
L0nf	L0m9	50	\N	\N
L0nQ	L076	1	\N	\N
L0nv	L076	1	\N	\N
L0ns	L076	1	\N	\N
L0nN	L076	1	\N	\N
L0jL	L076	1	\N	\N
L0jC	L076	1	\N	\N
L0jp	L076	1	\N	\N
L0jV	L076	1	\N	\N
L0j4	L076	1	\N	\N
L0je	L076	1	\N	\N
L0j9	L076	1	\N	\N
L0jq	L076	1	\N	\N
L0j7	L076	2	\N	\N
L0j8	L0m9	1	\N	\N
L0jz	L0m9	1	\N	\N
\.


--
-- Data for Name: sso_action_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_action_log (id, user_id, module_name, action_name, content, create_datetime, ip) FROM stdin;
\.


--
-- Data for Name: sso_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_company (id, code, name, short_name, industry, telephone, fax, address, reg_email, reg_date, expiry_date, status, file_storage_size, province, province_name, city, city_name, area, area_name, wx_appid, wx_secret, wxid, wx_account, wx_type, wx_qrcode, config) FROM stdin;
0001	0001	北京朗天鑫业信息工程技术有限公司	北京朗天鑫业	L0KU	010-12345678	010-12345678	西二旗西路领秀新硅谷C区15栋105	liusf@cnlentis.com	2014-08-28	2100-12-31	1	0	1	\N	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"p_custpool_c":"90","p_member_card_pay":"true","p_pact_alarm":"30","p_sale_audit":"false","p_sale_audit_type":"false","p_saletui_audit":"false","p_saletui_audit_type":"false","p_sysname":""}
0	0	系统	系统	IT解决方案					2014-08-28	2100-12-31	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	{p_pact_alarm:30,p_sale_audit:"false",p_sysname:"",p_saletui_audit_type:"false",p_sale_audit_type:"false",p_custpool_c:90,p_saletui_audit:"false",p_member_card_pay:"false"}
\.


--
-- Data for Name: sso_daily_phrase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_daily_phrase (id, company_id, content, sort_num, is_show) FROM stdin;
L0wo	0001	fdsfadsfsda	1	0
L0wZ	0001	fdsafsadas	2	0
\.


--
-- Data for Name: sso_department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_department (id, company_id, name, description, parent_id, parentids, head_id) FROM stdin;
00011	0001	技术部		\N	\N	\N
\.


--
-- Data for Name: sso_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_event (id, subject, start_date, start_time, end_date, end_time, venue, contacts_id, customer_id, creater_id, create_datetime, update_date, update_datetime, relation_id, repeat, description, isclose, is_deleted) FROM stdin;
\.


--
-- Data for Name: sso_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_fields (id, form_id, is_main, field, label, form_type, default_value, color, max_length, is_unique, is_null, is_validate, in_index, in_add, input_tips, setting, sort_num, operating) FROM stdin;
\.


--
-- Data for Name: sso_form; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_form (id, company_id, code, name, module_name) FROM stdin;
\.


--
-- Data for Name: sso_parame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_parame (id, company_id, parent_id, name, sort_num, is_end, type, description) FROM stdin;
L0qS	0001	\N	500-1000人	5	0	18	\N
L0qJ	0001	\N	1000人以上	6	0	18	\N
L0K2	0001	\N	50-100万	2	0	4	\N
L0qu	0001	\N	国有企业	1	0	19	\N
L0qD	0001	\N	集体所有制企业	2	0	19	\N
L0qI	0001	\N	私营企业	3	0	19	\N
L0qY	0001	\N	股份制企业	4	0	19	\N
L0qt	0001	\N	联营企业	5	0	19	\N
L0qb	0001	\N	外商投资企业	6	0	19	\N
L0K5	0001	\N	供应商介绍	1	0	2	\N
L0K8	0001	\N	客户介绍	1	1	2	\N
L0Kw	0001	\N	电话营销	1	1	2	\N
L0qB	0001	\N	股份合作企业	8	0	19	\N
L0KA	0001	\N	制造	1	0	3	\N
L0qh	0001	\N	方案制定	3	0	10	\N
L0q3	0001	\N	款项核验	8	0	10	\N
L0qH	0001	\N	合同谈判	10	0	10	\N
L0Hy	0001	\N	VPN	1	0	0	\N
L0Hp	0001	L0Hy	深信服	1	0	0	\N
L0KM	0001	\N	一级	1	0	6	\N
L0Kv	0001	\N	二级	2	0	6	\N
L0Vz	0001	\N	只	1	0	1	\N
L0Vn	0001	\N	台	1	0	1	\N
L0KE	0001	\N	三级	3	0	6	\N
L0Ks	0001	\N	四级	4	0	6	\N
L0Kl	0001	\N	售前联系	1	0	7	\N
L0Ka	0001	\N	销售确定	2	0	7	\N
L0KT	0001	\N	 合同洽谈	3	0	7	\N
L0dI	0001	\N	个	1	0	1	\N
L0K7	0001	\N	网络推广	1	0	2	\N
L0KN	0001	\N	下单确定	4	0	7	\N
L0qf	0001	\N	港、澳、台投资企业	7	0	19	\N
L0KX	0001	\N	其它	5	0	7	\N
L0qx	0001	\N	初创	1	0	20	\N
L0Kz	0001	\N	广告	1	0	2	\N
L0Kn	0001	\N	会议	1	0	2	\N
L0q0	0001	\N	售后服务	1	0	8	\N
L0Kg	0001	\N	医疗	1	0	3	\N
L0Kj	0001	\N	销售	1	0	3	\N
L0Kk	0001	\N	IT软件	1	0	3	\N
L0KU	0001	\N	IT硬件	1	0	3	\N
L0K6	0001	\N	0-50万	1	0	4	\N
L0KD	0001	\N	一般	1	0	5	\N
L0KI	0001	\N	非常好	1	0	5	\N
L0KY	0001	\N	很好	1	0	5	\N
L0Kt	0001	\N	不好	1	0	5	\N
L0qW	0001	\N	发展中	2	0	20	\N
L0qQ	0001	\N	衰弱	3	0	20	\N
L0ZC	0001	\N	公告	1	0	14	\N
L0Zy	0001	\N	生活小常识	1	0	14	\N
L0ZG	0001	\N	新闻	1	0	14	\N
L0qL	0001	\N	 销售意愿	1	0	8	\N
L0q1	0001	\N	未有购买意愿	1	0	9	\N
L0qO	0001	\N	 有购买意向	1	0	9	\N
L0qC	0001	\N	已达成购买意向	1	0	9	\N
L0qG	0001	\N	线索收集	1	0	10	\N
L0qy	0001	\N	初期沟通	2	0	10	\N
L0qp	0001	\N	商务沟通	3	0	10	\N
L0qV	0001	\N	实施	6	0	10	\N
L0qm	0001	\N	验收	7	0	10	\N
L0q4	0001	\N	服务支持	9	0	10	\N
L0qd	0001	\N	合同签约	5	0	10	\N
L0qi	0001	\N	电源	1	0	0	\N
L0KS	0001	\N	100-500万	3	0	4	\N
L0KJ	0001	\N	500-1000万	4	0	4	\N
L0Ku	0001	\N	1000万以上	5	0	4	\N
L0qk	0001	\N	20人以下	1	0	18	\N
L0qU	0001	\N	20-50人	2	0	18	\N
L0q6	0001	\N	50-100人	3	0	18	\N
L0q2	0001	\N	100-500人	4	0	18	\N
L0Zp	0001	L0ZC	部门公告	1	0	14	\N
L0ZH	0001	L0ZC	公司公告	1	0	14	\N
L0ce	0001	\N	 新业务	1	0	12	\N
L0cR	0001	\N	原有业务	2	0	12	\N
L0cr	0001	\N	意向客户	1	0	13	\N
L0c9	0001	\N	初步沟通	2	0	13	\N
L0cq	0001	\N	签订合同	4	0	13	\N
L0co	0001	\N	项目失败	5	1	13	\N
L0cK	0001	\N	深度沟通	3	0	13	\N
L0Ki	0001	\N	自己联系	1	0	2	\N
L0P2	0001	\N	防火墙	2	0	0	\N
L0PS	0001	\N	网关	2	0	0	\N
L0PJ	0001	\N	服务器	2	0	0	\N
L0Pu	0001	\N	机柜	2	0	0	\N
L0cZ	0001	\N	项目成功	6	1	13	\N
\.


--
-- Data for Name: sso_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_person (id, realname, sex, email, mobile, telephone, address, weixinid, head_pic, department, post, saltname, qq, xinzuo, blood_type, "character", company_id) FROM stdin;
L0zs	茹晓亮	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zl	井彤	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0za	周慧	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zT	李隆	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zN	乔萌	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zX	谭广荣	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0n0	谢怀宇	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nL	李江	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0n1	孟久龙	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nO	沈云	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nC	张浩	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nG	姜哲浩	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0ny	李云龙	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0np	程萍	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nd	孙默然	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nV	王志刚	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nm	陈晓东	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0n3	周伟兰	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0n4	郑丽娇	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nh	柴林和	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nF	张期朝	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0ne	左志军	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nR	马永平	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nr	杨芳	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0n9	周冬兰	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nK	罗辉	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nq	蒋纳成	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0no	徐颖杰	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nc	杨会宗	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nP	赵斌	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zB	王荣礼	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zb	邝艳青	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0nZ	陈磊	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0Zz	CEO	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
00123	龙影	1	loyin@loyin.net	1510001233	011-12332344	fdsafds	\N	/upload/image/logo/csO8GRU_1.jpg	\N	\N	\N	\N	\N	\N	\N	0001
L0iH	张建伟	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zx	郑韶贝	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zW	李静	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zQ	李聪	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zM	黄林燕	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zv	曾任文	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
L0zE	祁力帆	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0001
\.


--
-- Data for Name: sso_person_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_person_data (id, data) FROM stdin;
\.


--
-- Data for Name: sso_position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_position (id, company_id, parent_id, parentids, department_id, departids, name, description, permission, quota, type, sort_num, is_head, m) FROM stdin;
000111	0001	L0Gf	\N	L0GD	\N	管理员	fdsasadf	A1_1_S,A1_1_V,A1_1_E,A1_2_S,A1_2_V,A1_2_E,A2_1_S,A2_1_V,A2_1_E,A2_2_S,A2_2_V,A2_2_E,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E,A4_1_S,A4_1_V,A4_1_E,A4_2_S,A4_2_V,A4_2_E,A5_1_S,A5_1_V,A5_1_E,A7_1_S,A7_1_V,A7_1_E,A8_1_S,A8_2_S,A8_3_S,A8_4_S,A8_5_S,A8_6_S,A10_1_S,A10_1_V,A10_1_E,A11_1_S,A11_1_V,A11_1_E,A11_1_O	1	1	2	0	0
00011	0001	L0yk	\N	00011	\N	总经理室	范德萨	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	1	0	0
L0yk	0001	\N	\N	\N	\N	北京朗天鑫业信息工程技术有限公司	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	1	\N	\N
L0zw	0001	L0zo	\N	L0zc	\N	见习经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	0
L0GD	0001	L0yk	\N	\N	\N	技术部	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	2	\N	\N
L0zI	0001	L0zk	\N	L0z2	\N	见习经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	0
L0yz	0001	L0yk	\N	\N	\N	商务部	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	4	\N	\N
L0y8	0001	L0yk	\N	\N	\N	仓库	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	5	\N	\N
L0y5	0001	L0yk	\N	\N	\N	财务部	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	6	\N	\N
L0GY	0001	L0yk	\N	\N	\N	行政部	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	3	\N	\N
L0GB	0001	L0Gb	\N	L0GY	\N	行政	null	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	1	\N	1
L0zh	0001	L0yk	\N	\N	\N	朗天致远	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	2	\N	0
L0zY	0001	L0Gb	\N	L0zn	\N	总经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	1	1
L0zt	0001	L0zY	\N	L0zn	\N	销售经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	0
L0zj	0001	L0Gb	\N	L0z5	\N	部门总经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	1	1
L0zk	0001	L0Gb	\N	L0z2	\N	部门经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	1
L0zf	0001	\N	\N	00011	\N	兼职董事	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	1
L0zg	0001	L0zj	\N	L0z5	\N	部门副经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	1	1
L0zq	0001	L0yk	\N	\N	\N	朗天鑫业分销事业部	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	2	\N	0
L0zZ	0001	L0zq	\N	\N	\N	渠道一部	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	1	\N	0
L0zc	0001	L0zq	\N	\N	\N	渠道二部	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	2	\N	0
L0z5	0001	L0yk	\N	\N	\N	航天致远	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	2	\N	0
L0zz	0001	L0yk	\N	\N	\N	宇光致远	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	2	\N	0
L0zn	0001	L0yk	\N	\N	\N	山西分公司	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	2	\N	0
L0z6	0001	L0zz	\N	\N	\N	宇光致远一部	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	1	\N	0
L0z2	0001	L0zz	\N	\N	\N	宇光致远二部	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	2	\N	0
L0zF	0001	L0zh	\N	\N	\N	朗天致远一部	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	2	\N	0
L0ze	0001	L0zh	\N	\N	\N	朗天致远二部	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	0	2	\N	0
L0z4	0001	L0Gb	\N	00011	\N	营销助理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	0
L0nH	0001	L0z8	\N	L0zZ	\N	销售经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	0
L0zo	0001	L0Gb	\N	L0zq	\N	渠道总监	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	1
L0zS	0001	L0Gb	\N	L0z6	\N	部门经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	1	1
L0zD	0001	L0zk	\N	L0z2	\N	销售经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	0
L0zu	0001	L0zr	\N	L0ze	\N	销售经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	1
L0z9	0001	L0zr	\N	L0zF	\N	见习经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	0
L0z8	0001	L0zo	\N	L0zZ	\N	见习经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	2	\N	0
L0Gb	0001	\N	\N	00011	\N	总经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_2_S,A1_2_V,A1_2_E,A2_1_S,A2_1_V,A2_1_E,A2_2_S,A2_2_V,A2_2_E,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E,A4_1_S,A4_1_V,A4_2_S,A4_2_V,A5_1_S,A5_1_V,A7_1_S,A7_1_V,A8_1_S,A8_2_S,A8_3_S,A8_4_S,A8_5_S,A8_6_S,A10_1_S,A10_1_V,A10_1_E,A11_1_S,A11_1_V,A11_1_E,A11_1_O	1	1	1	1	1
L0Hs	0001	L0Gb	\N	L0yz	\N	商务助理	\N	A4_1_S,A4_1_V,A4_1_E,A4_2_S,A4_2_V,A4_2_E	1	1	1	\N	1
L0Gf	0001	L0Gb	\N	L0GD	\N	技术总监	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A2_1_S,A2_1_V,A2_1_E,A2_2_S,A2_2_V,A2_2_E,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E	1	1	1	1	1
L0yj	0001	L0yn	\N	L0y5	\N	出纳	\N	A7_1_S,A7_1_V,A7_1_E,A7_1_O	1	1	1	\N	\N
L0yn	0001	L0Gb	\N	L0y5	\N	会计	\N	A7_1_S,A7_1_V,A7_1_E,A7_1_O	1	1	1	\N	\N
000112	0001	L0Gf	\N	L0GD	\N	工程师	\N		1	1	3	\N	\N
L0zR	0001	L0Gb	\N	L0zh	\N	总经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E,A8_1_S,A8_1_V,A10_1_S,A10_1_S,A10_1_S	1	1	1	\N	1
L0zr	0001	L0zR	\N	L0zh	\N	部门经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E,A8_1_S,A8_1_V,A10_1_S,A10_1_S,A10_1_S	1	1	2	1	1
L0zK	0001	L0zr	\N	L0ze	\N	见习经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E,A8_1_S,A8_1_V,A10_1_S,A10_1_S,A10_1_S	1	1	2	\N	0
L0yg	0001	\N	\N	L0y8	\N	库管	cxzv	A4_1_S,A4_1_V,A4_1_E,A4_2_S,A4_2_V,A4_2_E,A5_1_S,A5_1_V,A5_1_E,A5_1_O	1	1	1	\N	\N
L0zA	0001	L0zg	\N	L0z5	\N	销售经理	\N	A1_1_S,A1_1_V,A1_1_E,A1_1_O,A1_1_I,A3_1_S,A3_1_V,A3_1_E,A3_2_S,A3_2_V,A3_2_E,A8_1_S,A8_3_S	1	1	2	\N	0
\.


--
-- Data for Name: sso_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sso_user (id, company_id, position_id, is_admin, status, uname, password, dashboard, login_ip, last_login_time, reg_date, remark) FROM stdin;
L0Zz	0001	L0Gb	0	1	manager	e10adc3949ba59abbe56e057f20f883e	\N	127.0.0.1	2014-11-03 13:57:42	2014-09-18	\N
L0zs	0001	000112	0	1	ruxiaoliang	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0zl	0001	000112	0	1	jingtong	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0za	0001	000112	0	1	zhouhui	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0zT	0001	000112	0	1	lilong	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0zN	0001	000112	0	1	qiaomeng	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0zX	0001	000112	0	1	tanguangrong	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0n0	0001	000112	0	1	xiehuaiyu	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nL	0001	L0zr	0	1	lijiang	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0n1	0001	L0z9	0	1	mengjiulong	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nO	0001	L0zK	0	1	shenyun	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
0	0	\N	1	1	system	e10adc3949ba59abbe56e057f20f883e	\N			2014-09-04	\N
L0nC	0001	L0zu	0	1	zhanghao	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nG	0001	L0zo	0	1	jiangzhehao	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0ny	0001	L0z8	0	1	liyunlong	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0np	0001	L0zw	0	1	chengping	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nd	0001	L0zj	0	1	sunmoran	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nV	0001	L0zg	0	1	wangzhigang	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nm	0001	L0zA	0	1	chenxiaodong	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0n3	0001	L0zk	0	1	zhouweilan	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0n4	0001	L0zI	0	1	zhenglijiao	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nh	0001	L0zD	0	1	chailinhe	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nF	0001	L0zt	0	1	zhangqichao	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0ne	0001	L0zt	0	1	zuozhijun	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nR	0001	L0zt	0	1	mayongping	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0iH	0001	L0Gf	0	1	zhangjianwei	e10adc3949ba59abbe56e057f20f883e	\N	127.0.0.1	2014-10-15 16:11:55	2014-10-10	\N
L0zx	0001	L0yj	0	1	zhengshaobei	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nr	0001	L0yn	0	1	yangfang	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0n9	0001	L0zR	0	1	zhoudonglan	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0zW	0001	L0yj	0	1	lijing	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0zQ	0001	L0yj	0	1	licong	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nK	0001	000112	0	1	luohui	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nq	0001	000112	0	1	jiangnacheng	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0no	0001	L0nH	0	1	xuyingjie	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nc	0001	L0zS	0	1	yanghuizong	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0nP	0001	L0zY	0	1	zhaobin	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0zB	0001	L0zf	0	1	wangrongli	e10adc3949ba59abbe56e057f20f883e	\N	\N	\N	2014-10-27	\N
L0zE	0001	L0GB	0	1	qilifan	e10adc3949ba59abbe56e057f20f883e	\N	127.0.0.1	2014-10-28 10:27:24	2014-10-27	\N
L0zb	0001	L0z4	0	1	kuangyanqing	e10adc3949ba59abbe56e057f20f883e	\N	127.0.0.1	2014-10-28 11:00:36	2014-10-27	\N
L0zv	0001	L0yg	0	1	zengrenwen	e10adc3949ba59abbe56e057f20f883e	\N	127.0.0.1	2014-10-30 14:52:58	2014-10-27	\N
L0zM	0001	L0yn	0	1	huanglinyan	e10adc3949ba59abbe56e057f20f883e	\N	127.0.0.1	2014-10-30 15:00:16	2014-10-27	\N
L0nZ	0001	L0zA	0	1	chenlei	e10adc3949ba59abbe56e057f20f883e	\N	127.0.0.1	2014-11-03 13:55:42	2014-10-27	\N
00123	0001	000111	1	1	loyin	e10adc3949ba59abbe56e057f20f883e	\N	127.0.0.1	2014-11-06 14:37:50	2014-09-04	fdsafads
\.


--
-- Data for Name: wf_audit_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wf_audit_detail (id, auditor_id, audit_datetime, audit_status, remark) FROM stdin;
L0i1	L0iH	2014-10-10	3	gfdsgfsdgsdg
L0i1	L0iH	2014-10-10	2	fdasfsadfasdf
L0i1	L0iH	2014-10-10	2	fdasfsadfasdf
L0wd	L0iH	2014-10-11 16:40:32	2	flajsd
L0wd	L0iH	2014-10-11 16:43:28	2	flajsd
L0wd	L0iH	2014-10-11 16:43:31	2	flajsd
L0wd	L0iH	2014-10-11 16:46:13	3	\N
L0wd	L0iH	2014-10-11 16:46:36	2	\N
L0wd	L0iH	2014-10-11 16:49:17	3	\N
L0wd	L0iH	2014-10-11 16:49:20	3	\N
L0wd	L0iH	2014-10-11 16:49:21	3	\N
L0wd	L0iH	2014-10-11 16:49:23	3	\N
L08P	L0iH	2014-10-15 16:12:15	2	dsafafsd
\.


--
-- Data for Name: wf_cc_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wf_cc_order (order_id, actor_id, status) FROM stdin;
\.


--
-- Data for Name: wf_hist_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wf_hist_order (id, process_id, order_state, creator, create_time, end_time, expire_time, priority, parent_id, order_no, variable) FROM stdin;
\.


--
-- Data for Name: wf_hist_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wf_hist_task (id, order_id, task_name, display_name, task_type, perform_type, task_state, operator, create_time, finish_time, expire_time, action_url, parent_task_id, variable) FROM stdin;
\.


--
-- Data for Name: wf_hist_task_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wf_hist_task_actor (task_id, actor_id) FROM stdin;
\.


--
-- Data for Name: wf_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wf_order (id, parent_id, process_id, creator, create_time, expire_time, last_update_time, last_updator, priority, parent_node_name, order_no, variable, version) FROM stdin;
\.


--
-- Data for Name: wf_process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wf_process (id, name, display_name, type, instance_url, state, content, version, create_time, creator, company_id) FROM stdin;
82211b9d9d3346ea85c5190e94b826fe	leave	请假	\N		1	98948	0	2014-09-14 21:59:43	\N	0001
\.


--
-- Data for Name: wf_surrogate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wf_surrogate (id, process_name, operator, surrogate, odate, sdate, edate, state) FROM stdin;
\.


--
-- Data for Name: wf_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wf_task (id, order_id, task_name, display_name, task_type, perform_type, operator, create_time, finish_time, expire_time, action_url, parent_task_id, variable, version) FROM stdin;
\.


--
-- Data for Name: wf_task_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wf_task_actor (task_id, actor_id) FROM stdin;
\.


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

SET search_path = pg_catalog;

BEGIN;

SELECT pg_catalog.lo_open('98948', 131072);
SELECT pg_catalog.lowrite(0, '\x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d3822207374616e64616c6f6e653d226e6f223f3e0d0a3c70726f6365737320646973706c61794e616d653d22e8afb7e5818722206e616d653d226c65617665223e0d0a3c737461727420646973706c61794e616d653d2273746172743122206c61796f75743d2232302c32382c2d312c2d3122206e616d653d22737461727431223e0d0a3c7472616e736974696f6e20673d2222206e616d653d227472616e736974696f6e3122206f66667365743d22302c302220746f3d22617070726f766544657074222f3e0d0a3c2f73746172743e0d0a3c656e6420646973706c61794e616d653d22656e643122206c61796f75743d223435332c33312c2d312c2d3122206e616d653d22656e6431222f3e0d0a3c7461736b2061737369676e65653d22617070726f7665446570742e6f70657261746f722220646973706c61794e616d653d22e4b88ae7baa7e5aea1e689b92220666f726d3d226c656176652f617070726f7665446570742e68746d6c22206c61796f75743d223131362c32352c2d312c2d3122206e616d653d22617070726f7665446570742220706572666f726d547970653d22414e59223e0d0a3c7472616e736974696f6e20673d2222206e616d653d227472616e736974696f6e3322206f66667365743d22302c302220746f3d226465636973696f6e31222f3e0d0a3c2f7461736b3e0d0a3c6465636973696f6e20646973706c61794e616d653d226465636973696f6e312220657870723d2223646179202667743b2032203f20277472616e736974696f6e3527203a20277472616e736974696f6e342722206c61796f75743d223237302c32382c2d312c2d3122206e616d653d226465636973696f6e31223e0d0a3c7472616e736974696f6e20646973706c61794e616d653d22e5b08fe4ba8ee7ad89e4ba8e4ee5a4a92220657870723d2223646179266c743b3d234e2220673d2222206e616d653d227472616e736974696f6e3422206f66667365743d22302c302220746f3d22656e6431222f3e0d0a3c7472616e736974696f6e20646973706c61794e616d653d22e5a4a7e4ba8e4ee5a4a92220657870723d22236461792667743b234e2220673d2222206e616d653d227472616e736974696f6e3522206f66667365743d22302c302220746f3d22617070726f7665426f7373222f3e0d0a3c2f6465636973696f6e3e0d0a3c7461736b2061737369676e65653d22617070726f7665426f73732e6f70657261746f722220646973706c61794e616d653d22e4b88ae7baa7e4b88ae58fb8e5aea1e689b92220666f726d3d226c656176652f617070726f7665426f73732e68746d6c22206c61796f75743d223235302c3132312c2d312c2d3122206e616d653d22617070726f7665426f73732220706572666f726d547970653d22414e59223e0d0a3c7472616e736974696f6e20673d2222206e616d653d227472616e736974696f6e3622206f66667365743d22302c302220746f3d22656e6431222f3e0d0a3c2f7461736b3e0d0a3c2f70726f636573733e0d0a');
SELECT pg_catalog.lo_close(0);

COMMIT;

SET search_path = public, pg_catalog;

--
-- Name: base_area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY base_area
    ADD CONSTRAINT base_area_pkey PRIMARY KEY (id);


--
-- Name: base_sncreater_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY base_sncreater
    ADD CONSTRAINT base_sncreater_code_key UNIQUE (code);


--
-- Name: base_sncreater_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY base_sncreater
    ADD CONSTRAINT base_sncreater_pkey PRIMARY KEY (id);


--
-- Name: crm_business_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_business_data
    ADD CONSTRAINT crm_business_data_pkey PRIMARY KEY (id);


--
-- Name: crm_business_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_business
    ADD CONSTRAINT crm_business_pkey PRIMARY KEY (id);


--
-- Name: crm_campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_campaigns
    ADD CONSTRAINT crm_campaigns_pkey PRIMARY KEY (id);


--
-- Name: crm_contact_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_contact_record
    ADD CONSTRAINT crm_contact_record_pkey PRIMARY KEY (id);


--
-- Name: crm_contacts_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_contacts_data
    ADD CONSTRAINT crm_contacts_data_pkey PRIMARY KEY (id);


--
-- Name: crm_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_contacts
    ADD CONSTRAINT crm_contacts_pkey PRIMARY KEY (id);


--
-- Name: crm_cust_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_cust_rating
    ADD CONSTRAINT crm_cust_rating_pkey PRIMARY KEY (id);


--
-- Name: crm_customer_cares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_customer_cares
    ADD CONSTRAINT crm_customer_cares_pkey PRIMARY KEY (id);


--
-- Name: crm_customer_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_customer_data
    ADD CONSTRAINT crm_customer_data_pkey PRIMARY KEY (id);


--
-- Name: crm_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_customer
    ADD CONSTRAINT crm_customer_pkey PRIMARY KEY (id);


--
-- Name: crm_customer_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_customer_record
    ADD CONSTRAINT crm_customer_record_pkey PRIMARY KEY (id);


--
-- Name: crm_email_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_email_template
    ADD CONSTRAINT crm_email_template_pkey PRIMARY KEY (id);


--
-- Name: crm_integral_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_integral_history
    ADD CONSTRAINT crm_integral_history_pkey PRIMARY KEY (id);


--
-- Name: crm_leads_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_leads_data
    ADD CONSTRAINT crm_leads_data_pkey PRIMARY KEY (id);


--
-- Name: crm_leads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_leads
    ADD CONSTRAINT crm_leads_pkey PRIMARY KEY (id);


--
-- Name: crm_recharge_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_recharge_record
    ADD CONSTRAINT crm_recharge_record_pkey PRIMARY KEY (id);


--
-- Name: crm_sms_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY crm_sms_template
    ADD CONSTRAINT crm_sms_template_pkey PRIMARY KEY (id);


--
-- Name: em_mechanism_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY em_mechanism
    ADD CONSTRAINT em_mechanism_pkey PRIMARY KEY (id);


--
-- Name: em_salegoal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY em_salegoal
    ADD CONSTRAINT em_salegoal_pkey PRIMARY KEY (id);


--
-- Name: em_team_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY em_team
    ADD CONSTRAINT em_team_name_key UNIQUE (name);


--
-- Name: em_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY em_team
    ADD CONSTRAINT em_team_pkey PRIMARY KEY (id);


--
-- Name: em_team_user_team_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY em_team_user
    ADD CONSTRAINT em_team_user_team_id_key UNIQUE (team_id);


--
-- Name: fa_account_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fa_account_detail
    ADD CONSTRAINT fa_account_detail_pkey PRIMARY KEY (id);


--
-- Name: fa_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fa_account
    ADD CONSTRAINT fa_account_pkey PRIMARY KEY (id);


--
-- Name: fa_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fa_invoice
    ADD CONSTRAINT fa_invoice_pkey PRIMARY KEY (id);


--
-- Name: fa_pay_receiv_ables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fa_pay_receiv_ables
    ADD CONSTRAINT fa_pay_receiv_ables_pkey PRIMARY KEY (id);


--
-- Name: fa_pay_receiv_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fa_pay_receiv_order
    ADD CONSTRAINT fa_pay_receiv_order_pkey PRIMARY KEY (id);


--
-- Name: fa_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fa_subject
    ADD CONSTRAINT fa_subject_pkey PRIMARY KEY (id);


--
-- Name: hr_assessment_kpi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hr_assessment_kpi
    ADD CONSTRAINT hr_assessment_kpi_pkey PRIMARY KEY (id);


--
-- Name: hr_assessment_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hr_assessment_model
    ADD CONSTRAINT hr_assessment_model_pkey PRIMARY KEY (id);


--
-- Name: hr_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hr_employee
    ADD CONSTRAINT hr_employee_pkey PRIMARY KEY (id);


--
-- Name: hr_pact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hr_pact
    ADD CONSTRAINT hr_pact_pkey PRIMARY KEY (id);


--
-- Name: hr_salary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hr_salary
    ADD CONSTRAINT hr_salary_pkey PRIMARY KEY (id);


--
-- Name: oa_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_comment
    ADD CONSTRAINT oa_comment_pkey PRIMARY KEY (id);


--
-- Name: oa_dream_board_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_dream_board
    ADD CONSTRAINT oa_dream_board_pkey PRIMARY KEY (id);


--
-- Name: oa_file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_file
    ADD CONSTRAINT oa_file_pkey PRIMARY KEY (id);


--
-- Name: oa_knowledge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_knowledge
    ADD CONSTRAINT oa_knowledge_pkey PRIMARY KEY (id);


--
-- Name: oa_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_message
    ADD CONSTRAINT oa_message_pkey PRIMARY KEY (id);


--
-- Name: oa_notice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_notice
    ADD CONSTRAINT oa_notice_pkey PRIMARY KEY (id);


--
-- Name: oa_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_task
    ADD CONSTRAINT oa_task_pkey PRIMARY KEY (id);


--
-- Name: oa_topic_rep_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_topic_rep
    ADD CONSTRAINT oa_topic_rep_pkey PRIMARY KEY (id);


--
-- Name: oa_workreport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_workreport
    ADD CONSTRAINT oa_workreport_pkey PRIMARY KEY (id);


--
-- Name: oa_workreporttemp_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_workreporttemp
    ADD CONSTRAINT oa_workreporttemp_name_key UNIQUE (name);


--
-- Name: oa_workreporttemp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_workreporttemp
    ADD CONSTRAINT oa_workreporttemp_pkey PRIMARY KEY (id);


--
-- Name: os_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY os_topic
    ADD CONSTRAINT os_topic_pkey PRIMARY KEY (id);


--
-- Name: scm_competitor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY scm_competitor
    ADD CONSTRAINT scm_competitor_pkey PRIMARY KEY (id);


--
-- Name: scm_depot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY scm_depot
    ADD CONSTRAINT scm_depot_pkey PRIMARY KEY (id);


--
-- Name: scm_order_data_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY scm_order_data
    ADD CONSTRAINT scm_order_data_id_key UNIQUE (id);


--
-- Name: scm_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY scm_order
    ADD CONSTRAINT scm_order_pkey PRIMARY KEY (id);


--
-- Name: scm_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY scm_product
    ADD CONSTRAINT scm_product_pkey PRIMARY KEY (id);


--
-- Name: scm_product_price_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY scm_product_price_order
    ADD CONSTRAINT scm_product_price_order_pkey PRIMARY KEY (id);


--
-- Name: scm_stock_allot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY scm_stock_allot
    ADD CONSTRAINT scm_stock_allot_pkey PRIMARY KEY (id);


--
-- Name: scm_stock_check_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY scm_stock_check
    ADD CONSTRAINT scm_stock_check_pkey PRIMARY KEY (id);


--
-- Name: scm_storage_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY scm_storage_bill
    ADD CONSTRAINT scm_storage_bill_pkey PRIMARY KEY (id);


--
-- Name: sso_action_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_action_log
    ADD CONSTRAINT sso_action_log_pkey PRIMARY KEY (id);


--
-- Name: sso_company_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_company
    ADD CONSTRAINT sso_company_code_key UNIQUE (code);


--
-- Name: sso_company_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_company
    ADD CONSTRAINT sso_company_name_key UNIQUE (name);


--
-- Name: sso_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_company
    ADD CONSTRAINT sso_company_pkey PRIMARY KEY (id);


--
-- Name: sso_company_short_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_company
    ADD CONSTRAINT sso_company_short_name_key UNIQUE (short_name);


--
-- Name: sso_daily_phrase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_daily_phrase
    ADD CONSTRAINT sso_daily_phrase_pkey PRIMARY KEY (id);


--
-- Name: sso_department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_department
    ADD CONSTRAINT sso_department_pkey PRIMARY KEY (id);


--
-- Name: sso_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_event
    ADD CONSTRAINT sso_event_pkey PRIMARY KEY (id);


--
-- Name: sso_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_fields
    ADD CONSTRAINT sso_fields_pkey PRIMARY KEY (id);


--
-- Name: sso_form_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_form
    ADD CONSTRAINT sso_form_pkey PRIMARY KEY (id);


--
-- Name: sso_parame_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_parame
    ADD CONSTRAINT sso_parame_pkey PRIMARY KEY (id);


--
-- Name: sso_person_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_person_data
    ADD CONSTRAINT sso_person_data_pkey PRIMARY KEY (id);


--
-- Name: sso_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_person
    ADD CONSTRAINT sso_person_pkey PRIMARY KEY (id);


--
-- Name: sso_position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_position
    ADD CONSTRAINT sso_position_pkey PRIMARY KEY (id);


--
-- Name: sso_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_user
    ADD CONSTRAINT sso_user_pkey PRIMARY KEY (id);


--
-- Name: unq_0002; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_department
    ADD CONSTRAINT unq_0002 UNIQUE (company_id, name);


--
-- Name: unq_0004; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_position
    ADD CONSTRAINT unq_0004 UNIQUE (company_id, department_id, name);


--
-- Name: unq_0005; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sso_user
    ADD CONSTRAINT unq_0005 UNIQUE (company_id, uname);


--
-- Name: unq_0009; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_workreport
    ADD CONSTRAINT unq_0009 UNIQUE (user_id, type, report_date);


--
-- Name: unq_0010; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oa_workreporttemp
    ADD CONSTRAINT unq_0010 UNIQUE (type, postion_id);


--
-- Name: wf_hist_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wf_hist_order
    ADD CONSTRAINT wf_hist_order_pkey PRIMARY KEY (id);


--
-- Name: wf_hist_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wf_hist_task
    ADD CONSTRAINT wf_hist_task_pkey PRIMARY KEY (id);


--
-- Name: wf_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wf_order
    ADD CONSTRAINT wf_order_pkey PRIMARY KEY (id);


--
-- Name: wf_process_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wf_process
    ADD CONSTRAINT wf_process_pkey PRIMARY KEY (id);


--
-- Name: wf_surrogate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wf_surrogate
    ADD CONSTRAINT wf_surrogate_pkey PRIMARY KEY (id);


--
-- Name: wf_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wf_task
    ADD CONSTRAINT wf_task_pkey PRIMARY KEY (id);


--
-- Name: idx_ccorder_order; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_ccorder_order ON wf_cc_order USING btree (order_id);


--
-- Name: idx_hist_order_no; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_hist_order_no ON wf_hist_order USING btree (order_no);


--
-- Name: idx_hist_order_processid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_hist_order_processid ON wf_hist_order USING btree (process_id);


--
-- Name: idx_hist_task_order; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_hist_task_order ON wf_hist_task USING btree (order_id);


--
-- Name: idx_hist_task_parenttask; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_hist_task_parenttask ON wf_hist_task USING btree (parent_task_id);


--
-- Name: idx_hist_task_taskname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_hist_task_taskname ON wf_hist_task USING btree (task_name);


--
-- Name: idx_hist_taskactor_task; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_hist_taskactor_task ON wf_hist_task_actor USING btree (task_id);


--
-- Name: idx_order_no; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_order_no ON wf_order USING btree (order_no);


--
-- Name: idx_order_processid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_order_processid ON wf_order USING btree (process_id);


--
-- Name: idx_process_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_process_name ON wf_process USING btree (name);


--
-- Name: idx_surrogate_operator; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_surrogate_operator ON wf_surrogate USING btree (operator);


--
-- Name: idx_task_order; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_task_order ON wf_task USING btree (order_id);


--
-- Name: idx_task_parenttask; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_task_parenttask ON wf_task USING btree (parent_task_id);


--
-- Name: idx_task_taskname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_task_taskname ON wf_task USING btree (task_name);


--
-- Name: idx_taskactor_task; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_taskactor_task ON wf_task_actor USING btree (task_id);


--
-- Name: base_area_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY base_area
    ADD CONSTRAINT base_area_pid_fkey FOREIGN KEY (pid) REFERENCES base_area(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: base_sncreater_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY base_sncreater
    ADD CONSTRAINT base_sncreater_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_business_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_business
    ADD CONSTRAINT crm_business_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES crm_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_business_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_business_data
    ADD CONSTRAINT crm_business_data_id_fkey FOREIGN KEY (id) REFERENCES crm_business(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_contact_record_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_contact_record
    ADD CONSTRAINT crm_contact_record_business_id_fkey FOREIGN KEY (business_id) REFERENCES crm_business(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_contact_record_contacts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_contact_record
    ADD CONSTRAINT crm_contact_record_contacts_id_fkey FOREIGN KEY (contacts_id) REFERENCES crm_contacts(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_contact_record_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_contact_record
    ADD CONSTRAINT crm_contact_record_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES crm_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_contacts_creater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_contacts
    ADD CONSTRAINT crm_contacts_creater_id_fkey FOREIGN KEY (creater_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_contacts_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_contacts
    ADD CONSTRAINT crm_contacts_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES crm_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_contacts_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_contacts_data
    ADD CONSTRAINT crm_contacts_data_id_fkey FOREIGN KEY (id) REFERENCES crm_contacts(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_customer_cares_contacts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_customer_cares
    ADD CONSTRAINT crm_customer_cares_contacts_id_fkey FOREIGN KEY (contacts_id) REFERENCES crm_contacts(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_customer_cares_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_customer_cares
    ADD CONSTRAINT crm_customer_cares_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES crm_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_customer_creater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_customer
    ADD CONSTRAINT crm_customer_creater_id_fkey FOREIGN KEY (creater_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_customer_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_customer_data
    ADD CONSTRAINT crm_customer_data_id_fkey FOREIGN KEY (id) REFERENCES crm_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_customer_head_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_customer
    ADD CONSTRAINT crm_customer_head_id_fkey FOREIGN KEY (head_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_customer_rating_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_customer
    ADD CONSTRAINT crm_customer_rating_fkey FOREIGN KEY (rating) REFERENCES crm_cust_rating(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_customer_record_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_customer_record
    ADD CONSTRAINT crm_customer_record_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES crm_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_customer_record_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_customer_record
    ADD CONSTRAINT crm_customer_record_user_id_fkey FOREIGN KEY (user_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_integral_history_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_integral_history
    ADD CONSTRAINT crm_integral_history_order_id_fkey FOREIGN KEY (order_id) REFERENCES scm_order(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_leads_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_leads
    ADD CONSTRAINT crm_leads_business_id_fkey FOREIGN KEY (business_id) REFERENCES crm_business(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_leads_contacts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_leads
    ADD CONSTRAINT crm_leads_contacts_id_fkey FOREIGN KEY (contacts_id) REFERENCES crm_contacts(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_leads_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_leads
    ADD CONSTRAINT crm_leads_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES crm_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_leads_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_leads_data
    ADD CONSTRAINT crm_leads_data_id_fkey FOREIGN KEY (id) REFERENCES crm_leads(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: crm_recharge_record_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY crm_recharge_record
    ADD CONSTRAINT crm_recharge_record_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES crm_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: em_mechanism_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY em_mechanism
    ADD CONSTRAINT em_mechanism_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: em_mechanism_creater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY em_mechanism
    ADD CONSTRAINT em_mechanism_creater_id_fkey FOREIGN KEY (creater_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: em_team_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY em_team
    ADD CONSTRAINT em_team_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: em_team_head_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY em_team
    ADD CONSTRAINT em_team_head_id_fkey FOREIGN KEY (head_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: em_team_user_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY em_team_user
    ADD CONSTRAINT em_team_user_team_id_fkey FOREIGN KEY (team_id) REFERENCES em_team(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: em_team_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY em_team_user
    ADD CONSTRAINT em_team_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fa_account_detail_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fa_account_detail
    ADD CONSTRAINT fa_account_detail_account_id_fkey FOREIGN KEY (account_id) REFERENCES fa_account(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fa_invoice_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fa_invoice
    ADD CONSTRAINT fa_invoice_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fa_pay_receiv_ables_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fa_pay_receiv_ables
    ADD CONSTRAINT fa_pay_receiv_ables_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fa_pay_receiv_order_accout_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fa_pay_receiv_order
    ADD CONSTRAINT fa_pay_receiv_order_accout_id_fkey FOREIGN KEY (account_id) REFERENCES fa_account(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fa_pay_receiv_order_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fa_pay_receiv_order
    ADD CONSTRAINT fa_pay_receiv_order_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fa_pay_receiv_order_payables_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fa_pay_receiv_order
    ADD CONSTRAINT fa_pay_receiv_order_payables_id_fkey FOREIGN KEY (payables_id) REFERENCES fa_pay_receiv_ables(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fa_pay_receiv_order_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fa_pay_receiv_order
    ADD CONSTRAINT fa_pay_receiv_order_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES fa_subject(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_hist_order_parentid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wf_hist_order
    ADD CONSTRAINT fk_hist_order_parentid FOREIGN KEY (parent_id) REFERENCES wf_hist_order(id);


--
-- Name: fk_hist_order_processid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wf_hist_order
    ADD CONSTRAINT fk_hist_order_processid FOREIGN KEY (process_id) REFERENCES wf_process(id);


--
-- Name: fk_hist_task_orderid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wf_hist_task
    ADD CONSTRAINT fk_hist_task_orderid FOREIGN KEY (order_id) REFERENCES wf_hist_order(id);


--
-- Name: fk_hist_taskactor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wf_hist_task_actor
    ADD CONSTRAINT fk_hist_taskactor FOREIGN KEY (task_id) REFERENCES wf_hist_task(id);


--
-- Name: fk_order_parentid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wf_order
    ADD CONSTRAINT fk_order_parentid FOREIGN KEY (parent_id) REFERENCES wf_order(id);


--
-- Name: fk_order_processid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wf_order
    ADD CONSTRAINT fk_order_processid FOREIGN KEY (process_id) REFERENCES wf_process(id);


--
-- Name: fk_task_actor_taskid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wf_task_actor
    ADD CONSTRAINT fk_task_actor_taskid FOREIGN KEY (task_id) REFERENCES wf_task(id);


--
-- Name: fk_task_orderid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wf_task
    ADD CONSTRAINT fk_task_orderid FOREIGN KEY (order_id) REFERENCES wf_order(id);


--
-- Name: hr_assessment_kpi_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hr_assessment_kpi
    ADD CONSTRAINT hr_assessment_kpi_model_id_fkey FOREIGN KEY (model_id) REFERENCES hr_assessment_model(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: hr_assessment_model_postion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hr_assessment_model
    ADD CONSTRAINT hr_assessment_model_postion_id_fkey FOREIGN KEY (postion_id) REFERENCES sso_position(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: hr_pact_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hr_pact
    ADD CONSTRAINT hr_pact_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES hr_employee(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: hr_salary_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hr_salary
    ADD CONSTRAINT hr_salary_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES hr_employee(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_comment_creator_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_comment
    ADD CONSTRAINT oa_comment_creator_role_id_fkey FOREIGN KEY (creator_role_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_dream_board_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_dream_board
    ADD CONSTRAINT oa_dream_board_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_dream_board_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_dream_board
    ADD CONSTRAINT oa_dream_board_user_id_fkey FOREIGN KEY (user_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_file_creater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_file
    ADD CONSTRAINT oa_file_creater_id_fkey FOREIGN KEY (creater_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_knowledge_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_knowledge
    ADD CONSTRAINT oa_knowledge_category_id_fkey FOREIGN KEY (category_id) REFERENCES sso_parame(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_knowledge_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_knowledge
    ADD CONSTRAINT oa_knowledge_user_id_fkey FOREIGN KEY (user_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_message_from_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_message
    ADD CONSTRAINT oa_message_from_user_id_fkey FOREIGN KEY (from_user_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_message_to_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_message
    ADD CONSTRAINT oa_message_to_user_id_fkey FOREIGN KEY (to_user_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_notice_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_notice
    ADD CONSTRAINT oa_notice_category_id_fkey FOREIGN KEY (category_id) REFERENCES sso_parame(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_notice_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_notice
    ADD CONSTRAINT oa_notice_user_id_fkey FOREIGN KEY (user_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_task_creater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_task
    ADD CONSTRAINT oa_task_creater_id_fkey FOREIGN KEY (creater_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_task_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_task
    ADD CONSTRAINT oa_task_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_topic_rep_rep_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_topic_rep
    ADD CONSTRAINT oa_topic_rep_rep_id_fkey FOREIGN KEY (rep_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_topic_rep_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_topic_rep
    ADD CONSTRAINT oa_topic_rep_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES os_topic(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_workreport_temp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_workreport
    ADD CONSTRAINT oa_workreport_temp_id_fkey FOREIGN KEY (temp_id) REFERENCES oa_workreporttemp(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_workreport_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_workreport
    ADD CONSTRAINT oa_workreport_user_id_fkey FOREIGN KEY (user_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_workreporttemp_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_workreporttemp
    ADD CONSTRAINT oa_workreporttemp_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: oa_workreporttemp_postion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oa_workreporttemp
    ADD CONSTRAINT oa_workreporttemp_postion_id_fkey FOREIGN KEY (postion_id) REFERENCES sso_position(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: os_topic_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os_topic
    ADD CONSTRAINT os_topic_category_id_fkey FOREIGN KEY (category_id) REFERENCES sso_parame(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: os_topic_creater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY os_topic
    ADD CONSTRAINT os_topic_creater_id_fkey FOREIGN KEY (creater_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_bizcompetitor_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_bizcompetitor
    ADD CONSTRAINT scm_bizcompetitor_business_id_fkey FOREIGN KEY (business_id) REFERENCES crm_business(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_bizcompetitor_competitor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_bizcompetitor
    ADD CONSTRAINT scm_bizcompetitor_competitor_id_fkey FOREIGN KEY (competitor_id) REFERENCES scm_competitor(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_order_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_order
    ADD CONSTRAINT scm_order_business_id_fkey FOREIGN KEY (business_id) REFERENCES crm_business(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_order_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_order
    ADD CONSTRAINT scm_order_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES crm_customer(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_order_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_order_data
    ADD CONSTRAINT scm_order_data_id_fkey FOREIGN KEY (id) REFERENCES scm_order(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_order_head_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_order
    ADD CONSTRAINT scm_order_head_id_fkey FOREIGN KEY (head_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_order_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_order_product
    ADD CONSTRAINT scm_order_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES scm_product(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_product_price_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_product_price
    ADD CONSTRAINT scm_product_price_id_fkey FOREIGN KEY (id) REFERENCES scm_product_price_order(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_product_price_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_product_price
    ADD CONSTRAINT scm_product_price_product_id_fkey FOREIGN KEY (product_id) REFERENCES scm_product(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_stock_allot_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_stock_allot_list
    ADD CONSTRAINT scm_stock_allot_list_id_fkey FOREIGN KEY (id) REFERENCES scm_stock_allot(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_stock_allot_list_prodcut_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_stock_allot_list
    ADD CONSTRAINT scm_stock_allot_list_prodcut_id_fkey FOREIGN KEY (product_id) REFERENCES scm_product(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_stock_check_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_stock_check_list
    ADD CONSTRAINT scm_stock_check_list_id_fkey FOREIGN KEY (id) REFERENCES scm_stock_check(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_stock_depot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_stock
    ADD CONSTRAINT scm_stock_depot_id_fkey FOREIGN KEY (depot_id) REFERENCES scm_depot(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_stock_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_stock
    ADD CONSTRAINT scm_stock_product_id_fkey FOREIGN KEY (product_id) REFERENCES scm_product(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_storage_bill_depot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_storage_bill
    ADD CONSTRAINT scm_storage_bill_depot_id_fkey FOREIGN KEY (depot_id) REFERENCES scm_depot(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_storage_bill_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_storage_bill_list
    ADD CONSTRAINT scm_storage_bill_list_id_fkey FOREIGN KEY (id) REFERENCES scm_storage_bill(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: scm_storage_bill_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scm_storage_bill
    ADD CONSTRAINT scm_storage_bill_order_id_fkey FOREIGN KEY (order_id) REFERENCES scm_order(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_action_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_action_log
    ADD CONSTRAINT sso_action_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_event_creater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_event
    ADD CONSTRAINT sso_event_creater_id_fkey FOREIGN KEY (creater_id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_fields_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_fields
    ADD CONSTRAINT sso_fields_form_id_fkey FOREIGN KEY (form_id) REFERENCES sso_form(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_form_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_form
    ADD CONSTRAINT sso_form_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_parame_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_parame
    ADD CONSTRAINT sso_parame_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_parame_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_parame
    ADD CONSTRAINT sso_parame_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES sso_parame(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_person_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_person_data
    ADD CONSTRAINT sso_person_data_id_fkey FOREIGN KEY (id) REFERENCES sso_person(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_person
    ADD CONSTRAINT sso_person_id_fkey FOREIGN KEY (id) REFERENCES sso_user(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_position_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_position
    ADD CONSTRAINT sso_position_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_position_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_position
    ADD CONSTRAINT sso_position_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES sso_position(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_user_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_user
    ADD CONSTRAINT sso_user_company_id_fkey FOREIGN KEY (company_id) REFERENCES sso_company(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sso_user_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sso_user
    ADD CONSTRAINT sso_user_position_id_fkey FOREIGN KEY (position_id) REFERENCES sso_position(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

