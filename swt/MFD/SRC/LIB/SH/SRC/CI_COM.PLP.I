/*
 * main common areas for command interpreter
 */

%replace CIDEPTH by 10;

dcl
   1 cicom ext static,
      2 ci_quote                bin (15), /* Pointer to string containing '"'"'' */
      2 ci_search_rule          bin (15), /* Pointer to search rule string */
      2 ci_quote_opt            bin (15), /* Pointer to quote option string */
      2 ci_prompt               bin (15), /* pointer to prompt string */
      2 ci_hello                bin (15), /* Pointer to hello string */
      2 ci_error_context        bin (15), /* Pointer to error context string */
      2 ci_default_sr           bin (15), /* Pointer to default search rule */
      2 ci_file                 bin (15), /* Current nesting level of shell */
      2 ci_trace,                         /* Command interpreter trace flags */
         3 cl_trace     bit (1),          /* Trace command lines as read */
         3 cn_trace     bit (1),          /* Trace compound node conversion */
         3 fn_trace     bit (1),          /* Trace function results */
         3 it_trace     bit (1),          /* Trace iteration conversion */
         3 pd_trace     bit (1),          /* Trace port assignments */
         3 ss_trace     bit (1),          /* Single-step network execution */
         3 ou_trace     bit (1),          /* Trace default onunit invocation */
         3 mbz          bit (2),          /* Reserved */
         3 sy_trace     bit (1),          /* Trace lexical analysis */
         3 lo_trace     bit (1),          /* Trace location of command */
         3 ls_trace     bit (1),          /* Trace linked-string garbage collection */
         3 nd_trace     bit (1),          /* Trace node execution */
         3 sr_trace     bit (1),          /* Trace shell variable restores */
         3 sv_trace     bit (1),          /* Trace shell variable saves */
         3 ex_trace     bit (1),          /* Trace network execution */
      2 ci_record               bin (15), /* File descriptor for statistics */
      2 ci_error_flag           bin (15), /* Indicate error return from shell */
      2 ci_fd (CIDEPTH)         bin (15), /* File descriptor of current ci file */
      2 ci_cnodes (CIDEPTH)     bin (15), /* Record of compound node usage */
      2 ci_buf (CIDEPTH)        bin (15), /* Pointer to buffer for this file */
      2 ci_mdate                bin (31), /* last date of mail file */
      2 ci_msize                bin (31), /* last size of mail file */
      2 ci_check                bin (31); /* last check of mail file */

/*
 *  End main common for command interpreter
 */
