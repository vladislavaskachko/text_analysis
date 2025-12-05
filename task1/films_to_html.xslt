<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Каталог фильмов</title>
                <style>
                    body {
                        font-family: 'Segoe UI', Arial, sans-serif;
                        background-color: #1a1a2e;
                        color: #eaeaea;
                        padding: 20px;
                        margin: 0;
                    }
                    
                    h1 {
                        text-align: center;
                        color: #e94560;
                        text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
                        margin-bottom: 30px;
                    }
                    
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin: 0 auto;
                        box-shadow: 0 4px 8px rgba(0,0,0,0.3);
                    }
                    
                    th {
                        background: linear-gradient(135deg, #e94560, #0f3460);
                        color: white;
                        padding: 15px 10px;
                        text-align: left;
                        font-weight: bold;
                        border: 1px solid #16213e;
                    }
                    
                    td {
                        padding: 12px 10px;
                        border: 1px solid #16213e;
                        vertical-align: top;
                    }
                    
                    tr:nth-child(even) {
                        background-color: #16213e;
                    }
                    
                    tr:nth-child(odd) {
                        background-color: #0f3460;
                    }
                    
                    tr:hover {
                        background-color: #533483;
                        transition: background-color 0.3s ease;
                    }
                    
                    .genre-tag {
                        display: inline-block;
                        background-color: #e94560;
                        color: white;
                        padding: 3px 8px;
                        margin: 2px;
                        border-radius: 12px;
                        font-size: 0.85em;
                    }
                    
                    .actor-list {
                        font-size: 0.9em;
                        line-height: 1.6;
                    }
                    
                    .money {
                        color: #4ecca3;
                        font-weight: bold;
                    }
                    
                    .rating {
                        display: inline-block;
                        background-color: #ff9800;
                        color: black;
                        padding: 3px 8px;
                        border-radius: 4px;
                        font-weight: bold;
                    }
                    
                    .footer {
                        text-align: center;
                        margin-top: 20px;
                        color: #888;
                    }
                </style>
            </head>
            <body>
                <h1>🎬 Каталог фильмов</h1>
                
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Название</th>
                        <th>Жанры</th>
                        <th>Режиссёр</th>
                        <th>Композитор</th>
                        <th>Актёры</th>
                        <th>Дата выхода</th>
                        <th>Сборы</th>
                        <th>Рейтинг</th>
                        <th>Зрители</th>
                        <th>Язык</th>
                    </tr>
                    <xsl:apply-templates select="films/film"/>
                </table>
                
                <div class="footer">
                    <p>Всего фильмов в каталоге: <xsl:value-of select="count(films/film)"/></p>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="film">
        <tr>
            <td><xsl:value-of select="@id"/></td>
            <td><strong><xsl:value-of select="title"/></strong></td>
            <td>
                <xsl:for-each select="genres/genre">
                    <span class="genre-tag"><xsl:value-of select="."/></span>
                </xsl:for-each>
            </td>
            <td>
                <xsl:for-each select="directors/director">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()"><br/></xsl:if>
                </xsl:for-each>
            </td>
            <td>
                <xsl:for-each select="composers/composer">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()"><br/></xsl:if>
                </xsl:for-each>
            </td>
            <td class="actor-list">
                <xsl:for-each select="cast/actor">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
            </td>
            <td><xsl:value-of select="releaseDate"/></td>
            <td class="money">
                <xsl:value-of select="format-number(boxOffice, '###,###,###')"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="boxOffice/@currency"/>
            </td>
            <td><span class="rating"><xsl:value-of select="ageRating"/></span></td>
            <td><xsl:value-of select="format-number(viewerCount, '###,###,###')"/></td>
            <td><xsl:value-of select="originalLanguage"/></td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>
