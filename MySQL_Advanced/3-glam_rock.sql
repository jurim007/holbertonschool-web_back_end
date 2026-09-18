-- THIS COMMMENT IS REQUIRED
SELECT band_name, IFNULL(split, 2024) - formed AS lifespan
-- Give me split — but if split is empty, give me 2024 instead.
-- split - formed = lifespan


FROM metal_bands
WHERE style LIKE '%Glam rock%'
-- Give me rows where style has 'Glam rock' somewhere inside it — anything can come before it, anything can come after it.

ORDER BY lifespan DESC;