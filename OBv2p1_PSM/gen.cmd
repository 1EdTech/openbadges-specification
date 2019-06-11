@ECHO OFF
ECHO Create imsob_v2p1.txmi...
java -jar %xslbasepath%\SaxonHE9-7-0-15J\saxon9he.jar -s:OBv2p1_PSM.uml -xsl:%xslbasepath%\txmiv1p0_generationtoolv2.xsl
IF %ERRORLEVEL% EQU 0 ( 
	ECHO Create OpenAPI files...
	java -jar %xslbasepath%\SaxonHE9-7-0-15J\saxon9he.jar -s:imsob_v2p1.txmi -xsl:%xslbasepath%\specificationv1p0_generationtoolv2.xsl
)
