<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:c="http://www.w3.org/ns/xproc-step"
		xmlns:gsp="http://www.w3.org/TR/sparql11-http-rdf-update/"
		xmlns:p="http://www.w3.org/ns/xproc"
		xmlns:test="http://www.w3.org/ns/xproc/test"
		xml:base="../../../"
		exclude-inline-prefixes="gsp"
	 	version="1.0">
	
	<p:output port="result"/>
	
	<p:serialization  port="result" encoding="UTF-8" indent="true" media-type="application/xml" method="xml"/>
	
	<p:import href="main/xproc/lib-gsp.xpl"/>
	<p:import href="test/resources/xproc/test.xpl"/>
	
	
	<gsp:submission method="get" request-uri="http://localhost:3030/test/data" media-type="text/turtle"/>
	
	<test:validate-with-schematron assert-valid="true">
		<p:input port="schema">
			<p:inline>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
	<ns uri="http://www.oecd.org/eoi" prefix="eoi"/>
	<ns prefix="c"		uri="http://www.w3.org/ns/xproc-step"/>
	<ns prefix="error"	uri="http://marklogic.com/xdmp/error"/>
	<pattern>
		<title>Check response status code</title>
		<rule context="/">
			<assert test="c:request">The root element must be c:request.</assert>
			<assert test="c:request/@method eq 'get'">The request method of '<value-of select="c:request/@method"/>' must be 'get'.</assert>
			<assert test="c:request/c:header[@name eq 'accept']/@value eq 'text/turtle'">The request accept header of '<value-of select="c:request/c:header[@name eq 'accept']/@value"/>' must be 'text/turtle'.</assert>
		</rule>
	</pattern>
</schema>
			</p:inline>
		</p:input>
		<p:input port="parameters">
			<p:empty/>
		</p:input>
	</test:validate-with-schematron>
	
</p:declare-step>