USE [AthletesSupplements2]
GO
/****** Object:  StoredProcedure [dbo].[up1]    Script Date: 11/14/2017 2:09:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[up1]
AS
BEGIN

ALTER TABLE Promotions
ALTER COLUMN Data varchar(30)

END
