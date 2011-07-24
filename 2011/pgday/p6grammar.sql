CREATE OR REPLACE FUNCTION is_inventory(text) RETURNS integer
LANGUAGE plperl6 AS $q$
($item) {
    # This grammar needs a 'my' because the default 
    # is 'our' i.e. package scope
    my grammar Inventory {
        regex product     { \d+ }
        regex quantity    { \d+ }
        regex color       { \S+ }
        regex description { \N* }
        rule TOP { ^^ <product> <quantity>
                    [
                    | <description> '(' \s* <color> \s*  ')'
                    | <color> <description>
                    ]
                    $$
        }
    }
    return ?Inventory.parse($item);
}
$q$;
