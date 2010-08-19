CREATE OR REPLACE FUNCTION
pir_concat(text,text,float)
RETURNS varchar LANGUAGE plpir AS $$
    .param string s1
    .param string s2
    .param num x
 if x < 0 goto backward
    $S1 = s1 . s2
    goto done
 backward:
    $S1 = s2 . s1
 done:
    .return($S1)
$$;
