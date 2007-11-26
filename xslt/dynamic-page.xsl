<?xml version="1.0" ?>
<!--

  $Id$

  This file is part of the OpenLink Software Ajax Toolkit (OAT) project.

  Copyright (C) 2007 OpenLink Software

  See LICENSE file for details.

-->
<xsl:stylesheet version="1.0" xmlns:xsl='http://www.w3.org/1999/XSL/Transform' 
    xmlns:i="urn:schemas-openlink-com:isparql">
    <xsl:output method="html"/>

	<xsl:template match = "/">
      <xsl:apply-templates select="//i:ISparqlDynamicPage"/>
    </xsl:template>

    <xsl:template match = "i:ISparqlDynamicPage">

	<html>
	<head>
		<script type="text/javascript">var featureList = ["xml"];</script>
		<script type="text/javascript" src="/isparql/toolkit/loader.js"></script>
		<script type="text/javascript">
			function init() {
				var target = "/isparql/execute.html";

				var p = {};
				p.sponge = "<xsl:value-of select="i:should_sponge" />";
				<xsl:if test="../i:should_sponge">
				p.sponge = "<xsl:value-of select="../i:should_sponge" />";
				</xsl:if>
				
				p.endpoint = "<xsl:value-of select="i:service" />";
				<xsl:if test="../i:service">
				p.endpoint = "<xsl:value-of select="../i:service" />";
				</xsl:if>

				p.defaultGraph = "<xsl:value-of select="i:graph" />";
				p.query = OAT.Xml.unescape($("p").innerHTML);
				p.file = window.location.href;
				
				var tmp = "";
				for (var prop in p) {
					tmp += prop+"="+encodeURIComponent(p[prop])+"&amp;";
				}
				window.location.href = target+"?"+tmp;
			}
		</script>
		<title>iSPARQL XSLT Forward</title>
	</head>
	<body><pre style="visibility:hidden;" id="p"><xsl:value-of select="i:query"/></pre>
	</body>
	</html>
	
	</xsl:template>
</xsl:stylesheet>
