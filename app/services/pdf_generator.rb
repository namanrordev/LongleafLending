require 'prawn-html'

class PdfGenerator

  def initialize(loan_details)
    @loan_details = loan_details
    @pdf = Prawn::Document.new(page_size: 'A4')
    @phtml = PrawnHtml::Instance.new(@pdf)
  end

  def print_data
    css = <<~CSS
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background-color: #f8f9fa;
      }
      .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%;
        max-width: 600px;
        text-align: center;
      }
      .logo {
        max-width: 150px;
        margin-bottom: 20px;
      }
      h1 {
        font-size: 24px;
        margin-bottom: 20px;
      }
      .details {
        margin-top: 20px;
      }
      table {
        width: 100%;
        border-collapse: collapse;
      }
      table, th, td {
        border: 1px solid #dee2e6;
      }
      th, td {
        padding: 12px;
        text-align: left;
      }
      th {
        background-color: #f8f9fa;
      }
    CSS
    @phtml.append(css: css)
    @phtml.append(html: '<body>
  <div class="container">
    <img src="images/logo/longleaf.png" alt="Logo" class="logo">
    <h1>Hi Naman, please find your sample term sheet with additional loan information.</h1>
    <div class="details">
      <table>
        <tr>
          <th>Email</th>
          <td>naman@yopmail.com</td>
        </tr>
        <tr>
          <th>Address</th>
          <td>Your Address Here</td>
        </tr>
        <tr>
          <th>Loan Term</th>
          <td>10 months</td>
        </tr>
        <tr>
          <th>Purchase Price</th>
          <td>$879</td>
        </tr>
        <tr>
          <th>Repair Budget</th>
          <td>$657</td>
        </tr>
        <tr>
          <th>After Repair Value (ARV)</th>
          <td>$67</td>
        </tr>
        <tr>
          <th>Loan Amount</th>
          <td>$766</td>
        </tr>
      </table>
    </div>
  </div>
</body>')
    @pdf.render
  end
end
