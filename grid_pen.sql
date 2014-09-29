CREATE TABLE squares AS SELECT 
      ('polygon (('   ||
      (x)::text       || ' ' ||  (y)::text       || ',' ||
      (x)::text       || ' ' ||  (.01 + y)::text || ',' ||
      (.01 + x)::text || ' ' ||  (.01 + y)::text || ',' ||
      (.01 + x)::text || ' ' ||  (y)::text       || ',' ||
      x::text         || ' ' ||  (y)::text       || '))')::geometry
FROM (SELECT -122.5 + .01*generate_series(0,100) AS x) a --last digit provides number of squares, decimal provides granularity, first digit provides origin
CROSS JOIN (SELECT 37.92 + .01*generate_series(0,100) AS y) b;
