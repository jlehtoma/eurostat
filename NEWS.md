# eurostat 2.2.20001

* `search_eurostat()` accepts new argument `fixed`: if `TRUE` 
(default), `pattern` provided will used as is; if `FALSE`, 
`pattern` will be interpreted as a true regex pattern.

# eurostat 2.2.20001

* Development version opened

# eurostat 2.2.1

* Fixed canonical cran url in README

# eurostat 2.1.1

* The complete package now using tibbles
* Rare encoding issues circumvented (#55)
* Improved functionality within firewall-protected systems (#63)

# eurostat 2.0

* The `get_eurostat()` returns tibbles (#52)
* The `get_eurostat_dic()` and `get_eurostat_toc()` return tibbles
* Now `read_tsv()` is used instead of `read.csv()` (#29)

# eurostat 1.2.27

* Calls to extract_numeric are replaced by as.numeric (#60)
* The column 'flags' is not being labelled even if type = "label" (#61)

# eurostat 1.2.22

* The European Commission and the Eurostat generally uses ISO 3166-1 alpha-2 codes with two exceptions: EL (not GR) is used to represent Greece, and UK (not GB) is used to represent the United Kingdom. This now  can be handled with `harmonize_country_code()` which converts the raw data values from EL to GR and from UK to GB.
* Harmonized roxygen documentation to better follow CRAN conventions
* Changed Windows encoding to UTF for input files 
* Improved memory usage

# eurostat 1.2.21

* The `get_eurostat()` can now get data also from the Eurostat JSON API via
  `get_eurostat_json()`. It also have a new argument `type` to select labels
  for variable values instead of codes.
* Fix an error after update to `tidyr 0.4.0` (#47).


# eurostat 1.2.13

* New `select_time` argument for `get_eurostat()` to select a time frequency 
  in case of multi-frequency datasets. Now the `get_eurostat()` also gives an
  error if you try to get multi-frequency with other time formats
  than `time_format = "raw"`. (#30) `time` column is also now in ascending
  order.
* `get_eurostat()` gets a new argument `compress_file` to control compression 
  of the cache file. Also cache filenames includes now all relevant arguments. (#28)
* For `search_eurostat()` a new type option `type = "all"` to search all types.
* For `label_eurostat()` new arguments. A `code` to retain also codes 
  for spesified colums. A `eu_order` to order factor levels in Eurostat order, 
  which uses the new function `dic_order()`. 
* Now `label_eurostat_vars(x)` gives labels for names, if x is other than
  a character or a factor and `label_eurostat_tables(x)` does not accept other
  than a character or a factor.
* For `get_eurostat()` a new argument `stringsAsFactors` to control the
  factor conversion of variables.
* `eurotime2date` (and `get_eurostat`) convers now also daily data. 

# eurostat 1.0.16

* Fixed vignette error

# eurostat 1.0.14 (2015-03-19)

* Package largely rewritten
* Vignette added
* Changed the value column to values in the get_eurostat output

# eurostat 0.9.1 (2014-04-24)

* Package collected from statfi and smarterpoland

