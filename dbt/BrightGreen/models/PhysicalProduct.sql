with PhysicalProduct as (select
    ProductID, 
    EANCode, 
    Description, 
    ItemPrice, 
    WidthInCm, 
    LengthInCm, 
    HeightInCm, 
    WeightInKG
    from {{ ref('raw_PhysicalProduct') }}
)
select * from PhysicalProduct