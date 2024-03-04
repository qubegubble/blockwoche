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

        // Specify the paths for XML, XSL, and temporary PDF output
        String xmlPath = "database/database.xml"; // Adjust path as necessary
        String xslPath = "feature-01/feature-01.xsl"; // Adjust path as necessary
        String outputPath = "/output.pdf"; // Adjust path as necessary

        // Generate the PDF
        XMLToPDFConverter converter = new XMLToPDFConverter();
        converter.generatePDF(xmlPath, xslPath, outputPath);

        // Set the response content type to PDF
        response.setContentType("application/pdf");

        // Read the generated PDF and write it to the response
        File pdfFile = new File(outputPath);
        response.setContentLength((int) pdfFile.length());

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
