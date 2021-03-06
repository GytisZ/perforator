rebar=./rebar

default: compile

get-deps:
	$(rebar) get-deps

compile: get-deps
	$(rebar) compile

clean:
	$(rebar) clean

nodeps:
	$(rebar) compile skip_deps=true

test:
	$(rebar) skip_deps=true eunit

test_%:
	$(rebar) skip_deps=true suite=$* eunit

perf:
	$(rebar) skip_deps=true perf

perf_%:
	$(rebar) skip_deps=true suite=$* perf

perfclean:
	$(rebar) skip_deps=true perf-clean

shell:
	erl -pa ebin/ -pa deps/*/ebin/ -sname shell


.PHONY: test get-deps
