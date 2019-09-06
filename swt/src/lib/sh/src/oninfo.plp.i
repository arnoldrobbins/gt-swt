/*
 * oninfo.plp.i --- PL/I condition info structure declaration
 */
%nolist;

declare
   1  bi based,
      2  file_ptr pointer options (short),
      2  info_struct_len bin (15),
      2  oncode_value bin (15),
      2  ret_addr pointer options (short),
      2  onfield_ptr pointer options (short),
      2  onfield_wd3 bin (15),
      2  onsource_ptr pointer options (short),
      2  onsource_wd3 bin (15),
      2  onchar_index bin (15),
      2  continuation label;

%list;
