<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <pre>
                    <xsl:copy-of select="."/>
                </pre>
                <h1>პაციენტის ინფორმაცია</h1>
                <p class="patienti-info-data">
          სახელი და გვარი:
                    <xsl:value-of select="/Root/Firstname"/>
                    <xsl:value-of select="/Root/Lastname"/>
                </p>
                <p class="patienti-info-data">
          ელ-ფოსტა:
                    <xsl:value-of select="/Root/Email"/>
                </p>
                <p class="patienti-info-data">
          პირადი ნომერი:
                    <xsl:value-of select="/Root/PersonalId"/>
                </p>
                <p class="patienti-info-data">
          ტელეფონი:
                    <xsl:value-of select="/Root/PhoneNumber"/>
                </p>
                <p class="patienti-info-data">
          მისამართი:
                    <xsl:value-of select="/Root/Address"/>
                </p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>