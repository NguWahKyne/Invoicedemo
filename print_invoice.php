<?php
session_start();
include 'Invoice.php';
$invoice = new Invoice();
$invoice->checkLoggedIn();
if(!empty($_GET['invoice_id']) && $_GET['invoice_id']) {
	echo $_GET['invoice_id'];
	$invoiceValues = $invoice->getInvoice($_GET['invoice_id']);		
	$invoiceItems = $invoice->getInvoiceItems($_GET['invoice_id']);		
}
$invoiceDate = date("d/M/Y, H:i:s", strtotime($invoiceValues['order_date']));
$output = '';
$output .= '<table width="100%" border="1" cellpadding="5" cellspacing="0">
	<tr>
	<td colspan="2" align="center" style="font-size:18px"><b>Invoice</b></td>
	</tr>
	<tr>
	<td colspan="2">
	<table width="100%" cellpadding="5">
	<tr>
	<td width="65%">
	 '.$invoiceValues['order_receiver_name'].'<br />
	 '.$invoiceValues['order_receiver_address'].'<br />
	</td>
	<td width="35%">         
	Invoice No. : '.$invoiceValues['order_id'].'<br />
	Invoice Date : '.$invoiceDate.'<br />
	</td>
	</tr>
	</table>
	<br />
	<table width="100%" border="1" cellpadding="5" cellspacing="0">
	<tr>
	<th align="left">No</th>
	<th align="left">Description</th>
	<th align="left">Quantity</th>
	<th align="left">UnitPrice</th>
	<th align="left">Actual Amt.</th> 
	</tr>';
$count = 0;   
foreach($invoiceItems as $invoiceItem){
	$count++;
	$output .= '
	<tr>
	
	<td align="left">'.$invoiceItem["item_code"].'</td>
	<td align="left">'.$invoiceItem["item_name"].'</td>
	<td align="left">'.$invoiceItem["order_item_quantity"].'</td>
	<td align="left">'.$invoiceItem["order_item_price"].'</td>
	<td align="left">'.$invoiceItem["order_item_final_amount"].'</td> 

	</tr>';
}
$output .= '
	<tr>
	<td align="right" colspan="5"><b>Sub Total</b></td>
	<td align="left"><b>'.$invoiceValues['order_total_before_tax'].'</b></td>
	</tr>
	<tr>
	<td align="right" colspan="5"><b>Tax Rate :</b></td>
	<td align="left">'.$invoiceValues['order_tax_per'].'</td>
	</tr>
	<tr>
	<td align="right" colspan="5">Tax Amount: </td>
	<td align="left">'.$invoiceValues['order_total_tax'].'</td>
	</tr>
	<tr>
	<td align="right" colspan="5">Total: </td>
	<td align="left">'.$invoiceValues['order_total_after_tax'].'</td>
	</tr>
	<tr>
	<td align="right" colspan="5">Amount Paid:</td>
	<td align="left">'.$invoiceValues['order_amount_paid'].'</td>
	</tr>
	<tr>
	<td align="right" colspan="5"><b>Amount Due:</b></td>
	<td align="left">'.$invoiceValues['order_total_amount_due'].'</td>
	</tr>';
$output .= '
	</table>
	</td>
	</tr>
	</table> <br><br><br>';

$output .='<div class="container">
			<div class="row">
            <div class="col-md-12">
              <span> Bank Account Name: RG Express Service Company Limited </span><br>
               <span>Bank Account No: 005120301003378 </span><br>
                <span>Bank Branch:0051-YGN Mini-PZD</span><br>
                <span>Bank Name: AYA Bank </span><br><br>
               <p> If you have any question about this invoice,please contant.<br>
                      Customer Service 01-8393227/01-8391801</p>
                  <span style="float: right;"> Thanks @ Best Regards</span>
             </div>
            </div><br><br>
          	<div class="row">
            <div class="col-sm-3"> <span>Checked By</span><hr style="height:1px;width:120px; border:none; color:#000; background-color:#000;margin-top: 50px;">
            </div>
            <div class="col-sm-3"><span>Approve By</span><hr style="height:1px;width:120px; border:none; color:#000; background-color:#000;margin-top: 50px;"> 
            </div>
            <div class="col-sm-3"> <span>Paid By</span><hr style="height:1px;width:120px; border:none; color:#000; background-color:#000;margin-top: 50px;">
            </div>
            <div class="col-sm-3"><span>Received By</span> <hr style="height:1px;width:120px; border:none; color:#000; background-color:#000;margin-top: 50px;">  
            </div>
            
          </div>
          </div>
         ';

// create pdf of invoice	
$invoiceFileName = 'Invoice-'.$invoiceValues['order_id'].'.pdf';
require_once 'dompdf/src/Autoloader.php';
Dompdf\Autoloader::register();
use Dompdf\Dompdf;
$dompdf = new Dompdf();
$dompdf->loadHtml(html_entity_decode($output));
$dompdf->setPaper('A4', 'landscape');
$dompdf->render();
$dompdf->stream($invoiceFileName, array("Attachment" => false));
?>   
   