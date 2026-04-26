-- ============================================================
-- Dim_Time — Time dimension table
-- ============================================================

CREATE TABLE Dim_Time (
    TimeKey   INTEGER     NOT NULL,
    Year      INTEGER     NOT NULL,
    Month     INTEGER     NOT NULL,
    MonthName NVARCHAR(20) NOT NULL,
    Quarter   INTEGER,
    CONSTRAINT PK_DimTime PRIMARY KEY (TimeKey)
);
