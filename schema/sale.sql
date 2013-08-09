CREATE TABLE AREA (
    AREA_ID   INTEGER NOT NULL AUTO_INCREMENT,
    AREA_NAME VARCHAR (128) NOT NULL,
    PRIMARY KEY(AREA_ID)
);

CREATE TABLE CITY (
    CITY_ID   INTEGER NOT NULL AUTO_INCREMENT,
    CITY_NAME VARCHAR (128) NOT NULL,
    PRIMARY KEY(CITY_ID)
);

CREATE TABLE MALL_LOCATION_MAPPING (
    CITY_ID INTEGER NOT NULL,
    AREA_ID INTEGER NOT NULL,
    MALL_ID INTEGER NOT NULL
);

CREATE TABLE STORE_LOCATION_MAPPING (
    CITY_ID INTEGER NOT NULL,
    AREA_ID  INTEGER NOT NULL,
    STORE_ID INTEGER NOT NULL
);

CREATE TABLE CATEGORY (
    CATEGORY_ID        INTEGER NOT NULL AUTO_INCREMENT,
    CATEGORY_NAME      VARCHAR (128) NOT NULL,
    PARENT_CATEGORY_ID INTEGER NOT NULL,
    PRIMARY KEY(CATEGORY_ID)
);

CREATE TABLE CITY_AREA_MAPPING (
    CITY_ID INTEGER NOT NULL,
    AREA_ID INTEGER NOT NULL
);

CREATE TABLE MALL (
    MALL_ID   INTEGER NOT NULL AUTO_INCREMENT,
    MALL_NAME VARCHAR (128) NOT NULL,
    LATITUDE  DECIMAL (13,8) NOT NULL,
    LONGITUDE DECIMAL (13,8) NOT NULL,
    PRIMARY KEY(MALL_ID)
);

CREATE TABLE PRODUCT (
    PRODUCT_ID   INTEGER NOT NULL AUTO_INCREMENT,
    PRODUCT_NAME VARCHAR (128) NOT NULL,
    PRIMARY KEY(PRODUCT_ID)
);

CREATE TABLE PRODUCT_CATEGORY_MAPPING (
    PRODUCT_ID  INTEGER NOT NULL,
    CATEGORY_ID INTEGER NOT NULL
);

CREATE TABLE SALE (
    SALE_ID    INTEGER NOT NULL AUTO_INCREMENT,
    STORE_ID   INTEGER NOT NULL,
    OFFER NVARCHAR (1024) NOT NULL,
    START_DATE DATE,
    END_DATE   DATE,
    PRIMARY KEY(SALE_ID)
);

CREATE TABLE SALE_PRODUCT_OFFER (
    OFFER_ID   INTEGER NOT NULL AUTO_INCREMENT,
    SALE_ID    INTEGER NOT NULL,
    PRODUCT_ID INTEGER NOT NULL,
    OFFER NVARCHAR (1024) NOT NULL,
    START_DATE DATE,
    END_DATE   DATE,
    PRIMARY KEY(OFFER_ID)
);

CREATE TABLE BRAND (
    BRAND_ID     INTEGER NOT NULL AUTO_INCREMENT,
    BRAND_NAME   VARCHAR (128) NOT NULL,
    PRIMARY KEY(BRAND_ID)
);

CREATE TABLE STORE (
    STORE_ID     INTEGER NOT NULL AUTO_INCREMENT,
    STORE_NAME  VARCHAR (256) NOT NULL
    ADDRESS      VARCHAR (256) NOT NULL,
    PHONE_NUMBER VARCHAR (128) NOT NULL,
    LATITUDE  DECIMAL (13,8) NOT NULL,
    LONGITUDE DECIMAL (13,8) NOT NULL,
    PRIMARY KEY(STORE_ID)
);

CREATE TABLE STORE_BRAND_MAPPING (
    STORE_ID    INTEGER NOT NULL,
    BRAND_ID    INTEGER NOT NULL
);

CREATE TABLE STORE_PRODUCT_MAPPING (
    STORE_ID   INTEGER NOT NULL,
    PRODUCT_ID INTEGER NOT NULL
);

CREATE TABLE MALL_STORE_MAPPING (
    MALL_ID INTEGER NOT NULL,
    STORE_ID   INTEGER NOT NULL
);

ALTER TABLE PRODUCT_CATEGORY_MAPPING ADD CONSTRAINT PRODUCT_CATEGORY_MAPPING_PK PRIMARY KEY (
  PRODUCT_ID, CATEGORY_ID
);

ALTER TABLE CITY_AREA_MAPPING ADD CONSTRAINT CITY_AREA_MAPPING_PK PRIMARY KEY (
  CITY_ID, AREA_ID
);

ALTER TABLE STORE_LOCATION_MAPPING ADD CONSTRAINT STORE_LOCATION_MAPPING_PK PRIMARY KEY (
  CITY_ID, AREA_ID, STORE_ID
);

ALTER TABLE STORE_BRAND_MAPPING ADD CONSTRAINT STORE_BRAND_MAPPING_PK PRIMARY KEY (
  STORE_ID, BRAND_ID
);

ALTER TABLE MALL_LOCATION_MAPPING ADD CONSTRAINT MALL_LOCATION_MAPPING_PK PRIMARY KEY (
  CITY_ID, AREA_ID, MALL_ID
);

ALTER TABLE STORE_PRODUCT_MAPPING ADD CONSTRAINT STORE_PRODUCT_MAPPING_PK PRIMARY KEY (
  STORE_ID, PRODUCT_ID
);

ALTER TABLE MALL_STORE_MAPPING ADD CONSTRAINT MALL_STORE_MAPPING_PK PRIMARY KEY (
  MALL_ID, STORE_ID
);

ALTER TABLE MALL_LOCATION_MAPPING ADD CONSTRAINT AMM_CITY_FK FOREIGN KEY (CITY_ID) REFERENCES CITY (CITY_ID);

ALTER TABLE MALL_LOCATION_MAPPING ADD CONSTRAINT AMM_AREA_FK FOREIGN KEY (AREA_ID) REFERENCES AREA (AREA_ID);

ALTER TABLE MALL_LOCATION_MAPPING ADD CONSTRAINT AMM_MALL_FK FOREIGN KEY (MALL_ID) REFERENCES MALL (MALL_ID);

ALTER TABLE STORE_LOCATION_MAPPING ADD CONSTRAINT ASM_CITY_FK FOREIGN KEY (CITY_ID) REFERENCES CITY (CITY_ID);

ALTER TABLE STORE_LOCATION_MAPPING ADD CONSTRAINT ASM_AREA_FK FOREIGN KEY (AREA_ID) REFERENCES AREA (AREA_ID);

ALTER TABLE STORE_LOCATION_MAPPING ADD CONSTRAINT ASM_STORE_FK FOREIGN KEY (STORE_ID) REFERENCES STORE (STORE_ID);

ALTER TABLE STORE_BRAND_MAPPING ADD CONSTRAINT ASM_STORE_FK FOREIGN KEY (STORE_ID) REFERENCES STORE (STORE_ID);

ALTER TABLE STORE_BRAND_MAPPING ADD CONSTRAINT ASM_BRAND_FK FOREIGN KEY (BRAND_ID) REFERENCES BRAND (BRAND_ID);

ALTER TABLE MALL_STORE_MAPPING ADD CONSTRAINT ASM_MALL_FK FOREIGN KEY (MALL_ID) REFERENCES MALL (MALL_ID);

ALTER TABLE MALL_STORE_MAPPING ADD CONSTRAINT ASM_STORE_FK FOREIGN KEY (STORE_ID) REFERENCES STORE (STORE_ID);

ALTER TABLE CATEGORY ADD CONSTRAINT CATEGORY_PARENT_CATEGORY_FK FOREIGN KEY (PARENT_CATEGORY_ID) REFERENCES CATEGORY (CATEGORY_ID);

ALTER TABLE CITY_AREA_MAPPING ADD CONSTRAINT CITY_AREA_MAPPING_AREA_FK FOREIGN KEY (AREA_ID) REFERENCES AREA (AREA_ID);

ALTER TABLE CITY_AREA_MAPPING ADD CONSTRAINT CITY_AREA_MAPPING_CITY_FK FOREIGN KEY (CITY_ID) REFERENCES CITY (CITY_ID);

ALTER TABLE PRODUCT_CATEGORY_MAPPING ADD CONSTRAINT PCM_CATEGORY_FK FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY (CATEGORY_ID);

ALTER TABLE PRODUCT_CATEGORY_MAPPING ADD CONSTRAINT PCM_PRODUCT_FK FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT (PRODUCT_ID);

ALTER TABLE STORE ADD CONSTRAINT STORE_BRAND_FK FOREIGN KEY (BRAND_ID) REFERENCES BRAND (BRAND_ID);

ALTER TABLE STORE ADD CONSTRAINT STORE_MALL_FK FOREIGN KEY (MALL_ID) REFERENCES MALL (MALL_ID);

ALTER TABLE SALE ADD CONSTRAINT SALE_PRODUCT_FK FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT (PRODUCT_ID);

ALTER TABLE SALE ADD CONSTRAINT SALE_STORE_FK FOREIGN KEY (STORE_ID) REFERENCES STORE (STORE_ID);

ALTER TABLE STORE_PRODUCT_MAPPING ADD CONSTRAINT SPM_PRODUCT_FK FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT (PRODUCT_ID);

ALTER TABLE STORE_PRODUCT_MAPPING ADD CONSTRAINT SPM_STORE_FK FOREIGN KEY (STORE_ID) REFERENCES STORE (STORE_ID);
