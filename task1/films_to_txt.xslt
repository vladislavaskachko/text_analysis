<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:text>КАТАЛОГ ФИЛЬМОВ&#10;</xsl:text>
        <xsl:text>================================================================================&#10;&#10;</xsl:text>
        <xsl:apply-templates select="films/film"/>
        <xsl:text>&#10;================================================================================&#10;</xsl:text>
        <xsl:text>Всего фильмов: </xsl:text>
        <xsl:value-of select="count(films/film)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="film">
        <xsl:text>Фильм #</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Название: </xsl:text>
        <xsl:value-of select="title"/>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Жанры: </xsl:text>
        <xsl:for-each select="genres/genre">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Режиссёр(ы): </xsl:text>
        <xsl:for-each select="directors/director">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Композитор(ы): </xsl:text>
        <xsl:for-each select="composers/composer">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Актёры: </xsl:text>
        <xsl:for-each select="cast/actor">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Дата выхода: </xsl:text>
        <xsl:value-of select="releaseDate"/>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Кассовые сборы: </xsl:text>
        <xsl:value-of select="format-number(boxOffice, '###,###,###')"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="boxOffice/@currency"/>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Возрастной рейтинг: </xsl:text>
        <xsl:value-of select="ageRating"/>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Количество зрителей: </xsl:text>
        <xsl:value-of select="format-number(viewerCount, '###,###,###')"/>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Язык оригинала: </xsl:text>
        <xsl:value-of select="originalLanguage"/>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>--------------------------------------------------------------------------------&#10;&#10;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>