package org.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/generate-pdf")
public class PDFGenerationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String xmlPath = "database/database.xml";
        String xslPath = "feature-01/fo.xsl";
        String outputPath = "/output.pdf";

        XMLToPDFConverter converter = new XMLToPDFConverter();
        converter.generatePDF(xmlPath, xslPath, outputPath);

        response.setContentType("application/pdf");

        File pdfFile = new File(outputPath);
        response.setContentLength((int) pdfFile.length());
        response.addHeader("Access-Control-Allow-Origin", "*");

        try (FileInputStream fileInputStream = new FileInputStream(pdfFile);
                OutputStream responseOutputStream = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                responseOutputStream.write(buffer, 0, bytesRead);
            }
        }
    }
}
