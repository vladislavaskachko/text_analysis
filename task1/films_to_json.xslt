<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:text>{&#10;</xsl:text>
        <xsl:text>  "films": [&#10;</xsl:text>
        <xsl:apply-templates select="films/film"/>
        <xsl:text>  ]&#10;</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="film">
        <xsl:text>    {&#10;</xsl:text>
        
        <xsl:text>      "id": </xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>,&#10;</xsl:text>
        
        <xsl:text>      "title": "</xsl:text>
        <xsl:value-of select="title"/>
        <xsl:text>",&#10;</xsl:text>
        
        <xsl:text>      "genres": [</xsl:text>
        <xsl:for-each select="genres/genre">
            <xsl:text>"</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>],&#10;</xsl:text>
        
        <xsl:text>      "directors": [</xsl:text>
        <xsl:for-each select="directors/director">
            <xsl:text>"</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>],&#10;</xsl:text>
        
        <xsl:text>      "composers": [</xsl:text>
        <xsl:for-each select="composers/composer">
            <xsl:text>"</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>],&#10;</xsl:text>
        
        <xsl:text>      "cast": [</xsl:text>
        <xsl:for-each select="cast/actor">
            <xsl:text>"</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>],&#10;</xsl:text>
        
        <xsl:text>      "releaseDate": "</xsl:text>
        <xsl:value-of select="releaseDate"/>
        <xsl:text>",&#10;</xsl:text>
        
        <xsl:text>      "boxOffice": {&#10;</xsl:text>
        <xsl:text>        "amount": </xsl:text>
        <xsl:value-of select="boxOffice"/>
        <xsl:text>,&#10;</xsl:text>
        <xsl:text>        "currency": "</xsl:text>
        <xsl:value-of select="boxOffice/@currency"/>
        <xsl:text>"&#10;</xsl:text>
        <xsl:text>      },&#10;</xsl:text>
        
        <xsl:text>      "ageRating": "</xsl:text>
        <xsl:value-of select="ageRating"/>
        <xsl:text>",&#10;</xsl:text>
        
        <xsl:text>      "viewerCount": </xsl:text>
        <xsl:value-of select="viewerCount"/>
        <xsl:text>,&#10;</xsl:text>
        
        <xsl:text>      "originalLanguage": "</xsl:text>
        <xsl:value-of select="originalLanguage"/>
        <xsl:text>"&#10;</xsl:text>
        
        <xsl:text>    }</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>
