<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:tr="http://schemas.geneabase.com/2013-v1/transcription"
    xmlns:html="http://schemas.geneabase.com/2013-v1/html" version="1.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="main" margin-top="36pt" margin-bottom="36pt"
                    page-width="210mm" page-height="297mm" margin-left="2cm" margin-right="2cm">
                    <fo:region-body margin-bottom="50pt" margin-right="50pt"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="main">
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    <xsl:template match="tr:file">
        <fo:block font-size="10pt">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:note">
        <fo:block font-size="10pt" font-style="italic">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:transcriber">
        <fo:block font-size="10pt" space-before="0.8em" space-after="0em"
            space-after.maximum="0.4em" color="black" keep-with-next.within-column="always"
            keep-together.within-column="always">
            Transcribent: <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:repository">
        <fo:block font-size="1.8em" font-weight="bold" space-before="0.8em" space-after="0em"
            space-after.maximum="0.4em" color="black" keep-with-next.within-column="always"
            keep-together.within-column="always">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:version">
        <fo:block font-size="10pt" space-before="0.8em" space-after="0em"
            space-after.maximum="0.4em" color="black" keep-with-next.within-column="always"
            keep-together.within-column="always">
            Versie <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:folder">
        <fo:block font-size="10pt" space-before="0.8em" space-after="0em"
            space-after.maximum="0.4em" color="black" keep-with-next.within-column="always"
            keep-together.within-column="always">
            Folder <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:region">
        <fo:block space-before="2em" space-after="2em">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:line">
        <fo:block space-before="0.5em" space-after="0.5em">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:file/tr:name">
        <fo:block font-size="1.4em" font-weight="bold" space-before="2em" space-after="0.4em"
            space-after.maximum="0.4em" color="blue" keep-with-next.within-column="always"
            keep-together.within-column="always"> File <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:page/tr:title">
        <fo:block font-size="1.2em" font-weight="bold" space-before="0.8em" space-after="0em"
            space-after.maximum="0.4em" color="red" keep-with-next.within-column="always"
            keep-together.within-column="always">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:region/tr:title">
        <fo:block font-size="1.2em" font-weight="bold" space-before="0.8em" space-after="0.4em"
            space-after.maximum="0.4em" color="black" keep-with-next.within-column="always"
            keep-together.within-column="always">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="html:span">
        <fo:inline>
            <xsl:choose>
                <xsl:when test="@class='strikethrough'">
                    <xsl:attribute name="text-decoration">line-through</xsl:attribute>
                </xsl:when>
                <xsl:when test="@class='underlined'">
                    <xsl:attribute name="text-decoration">underline</xsl:attribute>
                </xsl:when>
                <xsl:when test="@class='unclear'">
                    <xsl:attribute name="background-color">#b7de03</xsl:attribute>
                </xsl:when>
                <xsl:when test="@class='unreadable'">
                    <xsl:attribute name="background-color">#efd602</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    <xsl:template match="html:strong">
        <fo:inline font-weight="bold">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    
</xsl:stylesheet>
