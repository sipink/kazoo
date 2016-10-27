-ifndef(KAZOO_JSON_HRL).

-include_lib("kazoo/include/kz_types.hrl").

%% How do we wrap proplists to denote they're json objects?
%% -define(JSON_WRAPPER(Proplist), {struct, Proplist}).
%% -define(IS_JSON_GUARD(Obj), is_tuple(Obj)
%%         andalso element(1, Obj) =:= 'struct'
%%         andalso is_list(element(2, Obj))
%%        ).

-define(JSON_WRAPPER(Proplist), {Proplist}).

-define(EMPTY_JSON_OBJECT, ?JSON_WRAPPER([])).

-type json_value() :: 'null'
                    | boolean()
                    | json_string()
                    | json_number()
                    | object()
                    | json_array().
-type json_values() :: [json_value()] | [].

-type json_array()  :: [json_value()].
-type json_string() :: atom() | binary().
-type json_number() :: integer() | float().

-type object() :: {json_proplist()} | ?EMPTY_JSON_OBJECT.
-type objects() :: [object()] | [].

-type key() :: json_string().
-type keys() :: [key()].
-type path() :: keys() | key().
-type paths() :: [path()].

-type json_proplist() :: [{key(), json_value()}] | [].
-type json_proplists() :: [json_proplist()].

-type encode_option() :: 'uescape'
                       | 'pretty'
                       | 'force_utf8'
                       | 'escape_forward_slashes'
                       | {'bytes_per_iter', non_neg_integer()}
                       | {'bytes_per_red', non_neg_integer()}.

-type encode_options() :: [encode_option()].

-define(KAZOO_JSON_HRL, 'true').
-endif.
