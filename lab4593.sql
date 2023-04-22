IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'lab4')
CREATE DATABASE lab4;
go

use lab4;
go

IF OBJECT_ID('dbo.TFIDF') IS NULL
create table TFIDF(
 term varchar(50),
 doc1_TF float,
 doc2_TF float, 
 doc3_TF float,
 doc4_TF float,
 doc5_TF float,
 doc6_TF float,
 IDF float,
 doc1_TF_IDF float,
 doc2_TF_IDF float,
 doc3_TF_IDF float,
 doc4_TF_IDF float,
 doc5_TF_IDF float,
 doc6_TF_IDF float,
);



IF OBJECT_ID('dbo.Term_freq') IS NULL
create table Term_freq(
 term varchar(50),
 doc_num int,
 freq int, 
);

IF OBJECT_ID('dbo.Term_numDocs_colFreq') IS NULL
create table Term_numDocs_colFreq(
 term varchar(50),
 doc_num int,
 freq int,
);



select * from Term_numDocs_colFreq
select * from Term_freq
select * from TFIDF

