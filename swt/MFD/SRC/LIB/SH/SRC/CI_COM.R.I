# main common areas for command interpreter

integer Ci_file,                # current nesting level of shell
        Ci_fd (CIDEPTH),        # file descriptor of currect ci file
        Ci_error_flag,          # indicate error return from shell
        Ci_trace,               # command interpreter trace flag
        Ci_cnodes (CIDEPTH)     # record of compound node usage

pointer Ci_buf (CIDEPTH),       # pointer to buffer for this file
        Ci_quote,               # pointer to string containing '"'"''
        Ci_search_rule,         # pointer to search rule string
        Ci_quote_opt,           # pointer to quote option string
        Ci_error_context,       # pointer to error context string
        Ci_prompt,              # pointer to prompt string
        Ci_hello,               # pointer to hello string
        Ci_default_sr           # pointer to default search rule

filedes Ci_record               # file descriptor for statistics

longint Ci_mdate,               # last date of mail file
        Ci_msize,               # last size of mail file
        Ci_check                # last check of mail file

common /cicom/ Ci_quote, Ci_search_rule, Ci_quote_opt, Ci_prompt,
   Ci_hello, Ci_error_context, Ci_default_sr, Ci_file, Ci_trace,
   Ci_record, Ci_error_flag, Ci_fd, Ci_cnodes, Ci_buf, Ci_mdate,
   Ci_msize, Ci_check

# end main common areas for command interpreter
