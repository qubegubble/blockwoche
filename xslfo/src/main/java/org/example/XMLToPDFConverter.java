package org.example;

import org.apache.fop.apps.*;
import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;

public class XMLToPDFConverter {

    public void generatePDF(String xmlPath, String xslPath, String outputPath) {
        try {
            File xsltFile = new File(xslPath);
            StreamSource xmlSource = new StreamSource(new File(xmlPath));
            StreamSource xsltSource = new StreamSource(xsltFile);

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer(xsltSource);

            FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
            FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, outStream);

            Result res = new SAXResult(fop.getDefaultHandler());

            transformer.transform(xmlSource, res);

            try (OutputStream out = new FileOutputStream(new File(outputPath))) {
                out.write(outStream.toByteArray());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
