with map as (
    select case 
        when column_name='DATA_SOURCE_NAME' then 
            column_name 
        else ', ' || column_name ||' as '||  
            lower(COALESCE(label, column_name))
        end as label, ordinal_position 
    from information_schema.columns c 
        left outer join L10_STAGING.sem_lookup sm on upper(column_name)=upper(field_name)  
    where c.table_name = upper('ods_0customer_attr') 
    union
     select 'from {{ref('ods_0customer_attr')}} ', 5000 order by ordinal_position) 

select label as SELECT456 from map
