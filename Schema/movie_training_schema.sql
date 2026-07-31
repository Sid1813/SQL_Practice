/*
=====================================================
Movie Training Database Schema
Database: movie_training

Tables:
- customer
- film
- rental
=====================================================
*/

USE [movie_training];
GO

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

/*=====================================================
  TABLE: customer
=====================================================*/

CREATE TABLE [dbo].[customer](
    [customer_id] [smallint] NOT NULL,
    [first_name] [varchar](45) NOT NULL,
    [last_name] [varchar](45) NOT NULL,
    [email] [varchar](50) NULL,
    [phone] [varchar](20) NOT NULL,
    [active] [smallint] NOT NULL,
    [address] [varchar](50) NOT NULL,
    [city] [varchar](50) NOT NULL,
    [country] [varchar](50) NOT NULL
) ON [PRIMARY];
GO

ALTER TABLE [dbo].[customer] ADD DEFAULT ('0') FOR [customer_id];
ALTER TABLE [dbo].[customer] ADD DEFAULT (NULL) FOR [email];
ALTER TABLE [dbo].[customer] ADD DEFAULT ('1') FOR [active];

ALTER TABLE [dbo].[customer]
    WITH CHECK ADD CHECK (([customer_id] > (0)));
GO

/*=====================================================
  TABLE: film
=====================================================*/

CREATE TABLE [dbo].[film](
    [film_id] [smallint] NOT NULL,
    [title] [varchar](255) NOT NULL,
    [description] [varchar](max) NULL,
    [release_year] [numeric](4,0) NULL,
    [primary_language] [char](20) NULL,
    [category] [varchar](25) NULL,
    [length] [smallint] NULL,
    [rating] [varchar](30) NULL,
    [special_features] [varchar](100) NULL,
    [copies_in_stock] [bigint] NULL,
    [max_rental_duration] [smallint] NOT NULL,
    [rental_rate] [decimal](4,2) NOT NULL,
    [replacement_cost] [decimal](5,2) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO

ALTER TABLE [dbo].[film] ADD DEFAULT ('0') FOR [film_id];
ALTER TABLE [dbo].[film] ADD DEFAULT (NULL) FOR [release_year];
ALTER TABLE [dbo].[film] ADD DEFAULT (NULL) FOR [primary_language];
ALTER TABLE [dbo].[film] ADD DEFAULT (NULL) FOR [category];
ALTER TABLE [dbo].[film] ADD DEFAULT (NULL) FOR [length];
ALTER TABLE [dbo].[film] ADD DEFAULT ('G') FOR [rating];
ALTER TABLE [dbo].[film] ADD DEFAULT (NULL) FOR [special_features];
ALTER TABLE [dbo].[film] ADD DEFAULT ('0') FOR [copies_in_stock];
ALTER TABLE [dbo].[film] ADD DEFAULT ('3') FOR [max_rental_duration];
ALTER TABLE [dbo].[film] ADD DEFAULT ('4.99') FOR [rental_rate];
ALTER TABLE [dbo].[film] ADD DEFAULT ('19.99') FOR [replacement_cost];

ALTER TABLE [dbo].[film] WITH CHECK ADD CHECK (([film_id] > (0)));
ALTER TABLE [dbo].[film] WITH CHECK ADD CHECK (([length] > (0)));
ALTER TABLE [dbo].[film] WITH CHECK ADD CHECK (([max_rental_duration] > (0)));
ALTER TABLE [dbo].[film]
    WITH CHECK ADD CHECK (
        [rating] = 'G'
        OR [rating] = 'PG'
        OR [rating] = 'PG-13'
        OR [rating] = 'R'
        OR [rating] = 'NC-17'
    );
GO

/*=====================================================
  TABLE: rental
=====================================================*/

CREATE TABLE [dbo].[rental](
    [rental_id] [int] NOT NULL,
    [rental_date] [datetime2](0) NOT NULL,
    [customer_id] [smallint] NOT NULL,
    [film_id] [smallint] NOT NULL,
    [payment_date] [datetime2](0) NOT NULL,
    [amount] [decimal](5,2) NOT NULL,
    [tax] [decimal](3,2) NULL
) ON [PRIMARY];
GO

ALTER TABLE [dbo].[rental] ADD DEFAULT ('0') FOR [rental_id];
ALTER TABLE [dbo].[rental] ADD DEFAULT (NULL) FOR [tax];

ALTER TABLE [dbo].[rental]
    WITH CHECK ADD CHECK (([customer_id] > (0)));

ALTER TABLE [dbo].[rental]
    WITH CHECK ADD CHECK (([film_id] > (0)));
GO
