create function get_addr()
    returns address
    language plpgsql
as
$$
declare
    a address;
begin
    select * from address as a where a.address like '%' || '11' || '%' and city_id > 400 and city_id < 600;
    return a;
end;
$$
