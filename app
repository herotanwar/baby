AWD
Practical 1
A) Create an application to print on screen the output of adding, subtracting, multiplying and
dividing two numbers entered by the user in C#. WebForm1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="_1A.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:Label ID="Label1" runat="server" Text="Enter 1st number:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label2" runat="server" Text="Enter 2nd number:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Calculate"
/>
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="Add"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox3" runat="server" Width="393px"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label4" runat="server" Text="Subtract"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox4" runat="server" Width="359px"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label5" runat="server" Text="Multiply"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox5" runat="server" Width="351px"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label6" runat="server" Text="Divide"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox6" runat="server" Width="366px"></asp:TextBox>
</div>
</form>
</body>
</html>

WebForm1.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace _1A
{
public partial class WebForm1 : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{
}
protected void Button1_Click(object sender, EventArgs e)
{
int addition, subtraction, multiplication, division;
addition = Convert.ToInt32(TextBox1.Text) + Convert.ToInt32(TextBox2.Text);
subtraction = Convert.ToInt32(TextBox1.Text) - Convert.ToInt32(TextBox2.Text);
multiplication = Convert.ToInt32(TextBox1.Text) * Convert.ToInt32(TextBox2.Text);
division = Convert.ToInt32(TextBox1.Text) / Convert.ToInt32(TextBox2.Text);
TextBox3.Text = "Addition of the number is:" + addition;
TextBox4.Text = "Subtraction of the number is:" + subtraction;
TextBox5.Text = "Multiplication of the number is:" + multiplication;
TextBox6.Text = "Division of the number is:" + division;
}
}
}

B) Create an application to print Floyd’s triangle till n rows in C#. WebForm1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="_1B.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:Label ID="Label1" runat="server" Text="Flyods Triangle"></asp:Label>
<br />
<br />
<asp:Label ID="Label2" runat="server" Text="Enter the number of
rows:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Result" />
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
</div>
</form>
</body>
</html>

WebForm1.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace _1B
{
public partial class WebForm1 : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{
}
protected void Button1_Click(object sender, EventArgs e)
{
int numOfRows = Convert.ToInt32(TextBox1.Text);
int number = 1;
StringBuilder sb = new StringBuilder();
for (int i = 1; i <= numOfRows; i++) {
for (int j = 1; j <= i; j++) {
sb.Append(number + " ");
}
sb.Append("</br>");
}
Label3.Text=sb.ToString();
}
}
}

C) Create an application to demonstrate following operations
i. Generate Fibonacci series. ii. Test for prime numbers. WebForm1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="_1C.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:Label ID="Label1" runat="server" Text="Enter the number:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Fibonacci
series" />
<br />
<br />
<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
<br />
<br />
<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Prime
numbers" />
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
</div>
</form>
</body>
</html>

WebForm1.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace _1C
{
public partial class WebForm1 : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{
}
protected void Button1_Click(object sender, EventArgs e)
{
int a, b, c, i, n;
a = 1;
b = 1;
Label2.Text = a.ToString() + b.ToString();
n = Convert.ToInt32(TextBox1.Text);
for (i = 2; i < n; i++) {
c = a + b;
Label2.Text = Label2.Text + c.ToString();
a = b;
b = c;
}
}
protected void Button2_Click(object sender, EventArgs e)
{
int n, i, s = 0;
n = Convert.ToInt32(TextBox1.Text);
if (n == 0 || n == 1)
s = 1;
for (i = 2; i <= n / 2; ++i) {
if (n % i == 0) {
s = 1;
break;
}
}
if (s == 0)
Label3.Text = "The given number is prime";
else
Label3.Text = "The given number is not prime";
}
}
}

Practical 2
A) Create a simple application to demonstrate the concepts boxing and unboxing. WebForm1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="_2A.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:Label ID="Label1" runat="server" Text="Enter the value:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="height:
29px" Text="Print boxed and unboxed value" />
<br />
<br />
<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
</div>
</form>
</body>
</html>

WebForm.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace _2A
{
public partial class WebForm1 : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{
}
protected void Button1_Click(object sender, EventArgs e)
{
int valueType = Convert.ToInt32(TextBox1.Text);
object boxed = valueType;
Label2.Text = "Boxed Value:" + boxed;
int unboxed = (int)boxed;
Label3.Text = "Unboxed Value:" + unboxed;
}
}
}

B) Create a simple application to perform addition and subtraction using delegate. 
WebForm1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="_Practical2b.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:Label ID="Label1" runat="server" Text="Delegate Demo"></asp:Label>
<br />
<br />
<asp:Label ID="Label2" runat="server" Text="Enter the number 1:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="Enter the number 2:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delegate"
/>
<br />
<br />
<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
<br />
<br />
<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
</div>
</form>
</body>
</html>

WebForm1.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace _Practical2b
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        int Add(int a, int b)
        {
            return a + b;
        }
        int Subtract(int a, int b)
        {
            return a - b;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int x = Convert.ToInt32(TextBox1.Text);
            int y = Convert.ToInt32(TextBox2.Text);
            MathOperation add = new MathOperation(Add);
            MathOperation sub = new MathOperation(Subtract);
            Label4.Text = Add(x, y).ToString();
            Label5.Text = Subtract(x, y).ToString();
        }
    }

    internal class MathOperation
    {
        private Func<int, int, int> add;

        public MathOperation(Func<int, int, int> add)
        {
            this.add = add;
        }
    }
}

C) Create a simple application to demonstrate use of the concepts of interfaces
WebForm1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="_2C.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:Label ID="Label1" runat="server" Text="Area of circle and rectangle using
interface"></asp:Label>
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Result" />
<br />
<br />
<asp:Label ID="Label2" runat="server" Text="Area of the circle:"></asp:Label>
&nbsp;<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="Area of the rectangle:"></asp:Label>
&nbsp;<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
</div>
</form>
</body>
</html>

WebForm1.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace _2C
{
public partial class WebForm1 : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{
}
interface Area {
double show(double s, double t);
}
class Rect : Area {
public double show(double s, double t) {
return s*t;
}
}
class Circle : Area {
public double show(double s, double t) {
return (3.14*s*s);
}
}
protected void Button1_Click(object sender, EventArgs e)
{
Rect r1 = new Rect();
double x = r1.show(3, 4);
Circle c1=new Circle();
double y=c1.show(3, 4);
Label4.Text=x.ToString();
Label5.Text=y.ToString();
}
}
}

Practical 3
A) Create a simple web page with various server controls to demonstrate setting and use of
their properties. (Example : AutoPostBack)
(Note: On autopostback on each, give groupname to colors,add resource.file from newfile)
WebForm1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="_3A.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
ViewState Data:
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
<br />
<asp:Button ID="Button1" runat="server" Text="Get Data" OnClick="GetData" />
<br />
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
<asp:ListItem>c</asp:ListItem>
<asp:ListItem>C#</asp:ListItem>
<asp:ListItem>Python</asp:ListItem>
<asp:ListItem>Java</asp:ListItem>
</asp:DropDownList>
&nbsp;<asp:Button ID="Button2" runat="server" Text="Show" OnClick="ShowButton" />
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<br />
Select Color:
<asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" GroupName="Colors" Text="Red" OnCheckedChanged="RadioButton1_CheckedChanged"/>
<asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" GroupName="Colors" Text="Yellow" OnCheckedChanged="RadioButton2_CheckedChanged"
/>
<asp:RadioButton ID="RadioButton3" runat="server" AutoPostBack="True" GroupName="Colors" Text="White" OnCheckedChanged="RadioButton3_CheckedChanged"
/>
<br />
Select Special Formatting:
<asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="Bold" OnCheckedChanged="CheckButton1_CheckedChanged"/>
<asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Text="Itallic" OnCheckedChanged="CheckButton2_CheckedChanged"/>
<asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="True" Text="Underline" OnCheckedChanged="CheckButton3_CheckedChanged"/>
<br />
Select Size:
<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
<asp:ListItem>10</asp:ListItem>
<asp:ListItem>12</asp:ListItem>
<asp:ListItem>14</asp:ListItem>
<asp:ListItem>16</asp:ListItem>
<asp:ListItem>20</asp:ListItem>
</asp:DropDownList>
<br />
Select Name:
<asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
<asp:ListItem>Hetvi</asp:ListItem>
<asp:ListItem>Rimsha</asp:ListItem>
<asp:ListItem>Iqra</asp:ListItem>
</asp:DropDownList>
<br />
<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
<br />
Image:<br />
<asp:ImageButton ID="ImageButton1" runat="server" Height="100px"
ImageUrl="~/1323593.jpeg" />
</div>
</form>
</body>
</html>

WebForm1.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace _3A
{
public partial class WebForm1 : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{
if (IsPostBack) {
string str = "Hetvi Patel";
if (ViewState["name"] == null) {
ViewState["name"] = str;
}
}
}
protected void GetData(object sender, EventArgs e)
{
Label1.Text = ViewState["name"].ToString();
}
protected void ShowButton(object sender, EventArgs e)
{
TextBox1.Text = DropDownList1.SelectedItem.Text;
}
protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
{
Label2.Text= DropDownList2.SelectedItem.Text;
}
protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
{
Label2.Font.Size = FontUnit.Point(int.Parse(DropDownList2.SelectedItem.Text));
}
protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
{
Label2.Text = DropDownList3.SelectedItem.Text;
}
protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
{
Label2.BackColor=System.Drawing.Color.Red;
}
protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
{
Label2.BackColor = System.Drawing.Color.Yellow;
}
protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
{
Label2.BackColor = System.Drawing.Color.White;
}
protected void CheckButton1_CheckedChanged(object sender, EventArgs e)
{
Label2.Font.Bold = CheckBox1.Checked;
}
protected void CheckButton2_CheckedChanged(object sender, EventArgs e)
{
Label2.Font.Bold = CheckBox2.Checked;
}
protected void CheckButton3_CheckedChanged(object sender, EventArgs e)
{
Label2.Font.Bold = CheckBox3.Checked;
}
}
}

B) Create a simple application to demonstrate your vacation using calendar control. 
Calc
WebForm1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Calc.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 413px;
        }
    </style>
</head>
<body style="height: 383px">
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Reset" />
    </form>
</body>
</html>

WebForm1.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Calc
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            {
                if (e.Day.Date.Day == 5 && e.Day.Date.Month == 9)
                {
                    e.Cell.BackColor = System.Drawing.Color.Yellow;
                    Label lbl = new Label();
                    lbl.Text = "<br> Teachers Day!";
                    e.Cell.Controls.Add(lbl);
                    Image g1 = new Image();
                    g1.ImageUrl = "tg.jpg";
                    g1.Height = 20;
                    g1.Width = 20;
                    e.Cell.Controls.Add(g1);
                }

                if (e.Day.Date.Day == 23 && e.Day.Date.Month == 10)
                {
                    Calendar1.SelectedDate = new DateTime(2022, 10, 23);
                    Calendar1.SelectedDates.SelectRange(Calendar1.SelectedDate,
                    Calendar1.SelectedDate.AddDays(5));
                    Label lb1 = new Label();
                    lb1.Text = "<br> Diwali!";
                    e.Cell.Controls.Add(lb1);

                }
            }
        }


        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            {
                Label1.Text = "Your Selected Date:" + Calendar1.SelectedDate.Date.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.Caption = "Hetvi Patel";
            Calendar1.FirstDayOfWeek = FirstDayOfWeek.Sunday;
            Calendar1.NextPrevFormat = NextPrevFormat.FullMonth;
            Calendar1.TitleFormat = TitleFormat.Month;
            Label2.Text = "Today Date" + Calendar1.SelectedDate.ToShortDateString();
            Label3.Text = "Diwali Vacation Start: 19-10-2025";
            if (Calendar1.SelectedDate.ToShortDateString() == "19-10-2025")
                Label3.Text = "Diwali Festival Start</b>";
            TimeSpan d = new DateTime(2025, 10, 19) - Calendar1.SelectedDate;
            Label4.Text = "DaysRemaining for Diwali Vacation:" + d.Days.ToString();


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            {
                Label1.Text = "";
                Label2.Text = "";
                Label3.Text = "";
                Label4.Text = "";
                Calendar1.SelectedDates.Clear();
            }
        }
    }
}

C) Demonstrate the use of Treeview operations on the web form. 
WebForm1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="Practicall3c.WebFormTreeNode1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:TreeView ID ="TreeView1" runat="server" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
</asp:TreeView>
<asp:datalist ID="DataList1" runat="server" CellPadding="5">
<ItemTemplate>
<div style="border:1px solid #ccc; padding:10px; margin-bottom:10px;">
<h3><%# Eval("Title") %></h3>
<p><%# Eval("Price") %></p>
</div>
</ItemTemplate>
</asp:datalist>
</div>
</form>
</body>
</html>

WebForm1.aspx.cs
using System;
using System.Data;
using System.Web.UI.WebControls;
namespace Practicall3c
{
    public partial class WebFormTreeNode1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTreeView();
            }
        }
        private void BindTreeView()
        {
            TreeNode electronics = new TreeNode("Electronics");
            electronics.ChildNodes.Add(new TreeNode("Mobile", "Mobile"));
            electronics.ChildNodes.Add(new TreeNode("Laptop", "Laptop"));
            electronics.ChildNodes.Add(new TreeNode("TV", "TV"));
            TreeNode clothing = new TreeNode("Clothing");
            clothing.ChildNodes.Add(new TreeNode("Men", "Men"));
            clothing.ChildNodes.Add(new TreeNode("Women", "Women"));
            TreeView1.Nodes.Add(electronics);
            TreeView1.Nodes.Add(clothing);
        }
        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {
            string category = TreeView1.SelectedValue;
            DataList1.DataSource = GetProductsByCategory(category);
            DataList1.DataBind();
        }
        private DataTable GetProductsByCategory(string category)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Title");
            dt.Columns.Add("Price");
            if (category == "Mobile")
            {
                dt.Rows.Add("Smartphone", "699");
                dt.Rows.Add("TelePhone", "99");
            }
            else if (category == "Laptop")
            {
                dt.Rows.Add("Dell", "30000");
                dt.Rows.Add("Hp", "25000");
            }
            else if (category == "TV")
            {
                dt.Rows.Add("Samsumg", "35800");
                dt.Rows.Add("MI", "10000");
            }
            else if (category == "Men")
            {
                dt.Rows.Add("Shirt", "1000");
                dt.Rows.Add("Jeans", "500");
            }
            else if (category == "Women")
            {
                dt.Rows.Add("saree", "5000");
                dt.Rows.Add("Handbag", "1500");
            }
            return dt;
        }
    }
}

Practical 4
A) Create a Registration form to demonstrate use of various Validation controls. 
WebFormRegValidator.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormRegValidator.aspx.cs"
Inherits="WebApplicationRegFormm.WebFormRegValidator" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<h2>Registration Form</h2>
<asp:Label ID="lblName" runat="server" Text="Full Name:"></asp:Label>
<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Label ID="lblemail" runat="server" Text="Email:"></asp:Label>
<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="Red"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
<br />
<br />
<asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." ForeColor="Red"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Label ID="lblConfirmPassword" runat="server" Text="ConfirmPassword:"></asp:Label>
<asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
<asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" ForeColor="Red">
</asp:CompareValidator>
<br />
<br />
<asp:Label ID="lblAge" runat="server" Text="Age:"></asp:Label>
<asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
<asp:RangeValidator ID="rvAge" runat="server" ErrorMessage="Age Must BeBetween 18 to 60" MinimumValue="18" MaximumValue="60" Type="Integer" ForeColor="Red" ControlToValidate ="txtAge"></asp:RangeValidator>
<br />
<br />
<asp:Label ID="lblCountry" runat="server" Text="Country:"></asp:Label>
<asp:DropDownList ID="ddlCountry" runat="server">
<asp:ListItem Text="Select Country" Value=""></asp:ListItem>
<asp:ListItem Text="USA" Value="USA"></asp:ListItem>
<asp:ListItem Text="Canada" Value="Canada"></asp:ListItem>
<asp:ListItem Text="UK" Value="UK"></asp:ListItem>
<asp:ListItem Text="Australia" Value="Australia"></asp:ListItem>
<asp:ListItem Text="India" Value="India"></asp:ListItem>
<asp:ListItem Text="Other" Value="Other"></asp:ListItem>
</asp:DropDownList>
<asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="ddlCountry"
InitialValue="" ErrorMessage="Country is required." ForeColor="Red"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
<br />
<br />
<asp:ValidationSummary ID="vsSummary" runat="server" HeaderText="Pleasecorrect the following errors:" ForeColor="Red" ShowMessageBox="True" ShowSummary="True" />
</div>
</form>
</body>
</html>

WebFormRegValidator.aspx.cs
using System;
using System.Web.UI;
namespace WebApplicationRegFormm
{
    public partial class WebFormRegValidator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Process the form data
                Response.Write("<script> alert('Registration successful!');</script>");
            }
        }
    }
}

B) Create Web Form to demonstrate use of Adrotator Control. 
AdRotator.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdRotator.aspx.cs"
Inherits="Prac4b.AdRotator" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<h2>AdRotator</h2>
<asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/Ads.xml" Width="300px" Height="250px" />
</div>
</form>
</body>
</html>

Add>new>folder>Images>add image from google saved on folder

Ads.xml
<?xml version="1.0" encoding="utf-8" ?>
<Advertisements>
	<Ad>
		<ImageUrl>~/Images/1286510.jpg</ImageUrl>
		<NavigateUrl>https://www.Google.com</NavigateUrl>
		<AlternateText>Visit Google</AlternateText>
		<Impressions>5</Impressions>
	</Ad>
	<Ad>
		<ImageUrl>~/Images/1323593.jpeg</ImageUrl>
		<NavigateUrl>https://www.Microsoft.com</NavigateUrl>
		<AlternateText>Visit Google</AlternateText>
		<Impressions>3</Impressions>
	</Ad>
	<Ad>
		<ImageUrl>~/Images/brownpanda.jpg</ImageUrl>
		<NavigateUrl>https://www.ChatGPT.com</NavigateUrl>
		<AlternateText>Visit Chatgpt</AlternateText>
		<Impressions>2</Impressions>
	</Ad>
</Advertisements>

C) Create a web form to demonstrate use user controls
UserControlDemo
Select Web User Control
Header.ascx
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Header" %>

<div style="background-color: #0078D7; color: white; padding: 15px; text-align: center; border-radius: 5px;">
    <h2>🌐 Welcome to My Website</h2>
    <asp:Label ID="lblTime" runat="server" />
</div>

Header.ascx.cs
using System;

public partial class Header : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblTime.Text = "Current Time: " + DateTime.Now.ToString("hh:mm:ss tt");
    }
}

Select Web Form
Default.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Src="Header.ascx" TagName="Header" TagPrefix="uc" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>User Control Demo</title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Include the User Control -->
        <uc:Header ID="Header1" runat="server" />
        
        <div style="padding:20px;">
            <h3>This is the main content of the page.</h3>
            <asp:Button ID="btnShow" runat="server" Text="Click Me" OnClick="btnShow_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>

Default.aspx.cs
using System;

public partial class _Default : System.Web.UI.Page
{
    protected void btnShow_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "Button Clicked! The User Control is working successfully.";
    }
}

Practical 5
A) Create Web Form to demonstrate use of Website Navigation controls. 
Create project name WebApplicationNavigationControl
Web.sitemap (sitemap)
<?xml version="1.0" encoding="utf-8" ?>
<siteMap xmlns="http://schemas.microsoft.com/AspNet/SiteMap-File-1.0" >	
	<siteMapNode url="~/Default.aspx" title="Home"  description="Home Page">
		<siteMapNode url="~/About.aspx" title="About"  description="About the Website" />
		<siteMapNode url="~/Contact.aspx" title="Contact"  description="Contact Information" />
		<siteMapNode url="~/Services.aspx" title="Services"  description="Our Servies">
			<siteMapNode url="~/WebDev.aspx" title="Web Development"/>
			<siteMapNode url="~/AppDev.aspx" title="App Development"/>
		</siteMapNode>
	</siteMapNode>
</siteMap>

Default.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplicationNavigationControl.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="Menu1" runat="server" DataSourceID="SiteMapDataSource1" Orientation="Horizontal" StaticDisplayLevels="2">
            </asp:Menu>

            <br />
            <br />

            <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1">
            </asp:TreeView>
            <br />
            <br />

            <asp:SiteMapPath ID="SiteMapPath1" runat="server"/>

            <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server"/>
        </div>
    </form>
</body>
</html>
Create same code webfrom for About, Home, Contact, Services, WebDev, AppDev

B) Create a web application to demonstrate use of Master Page and content page. 
(Add>Web forms master page>folder>App_theme[add>stylesheet])
Site1.Master
<%@ Master Language="C#" AutoEventWireup="true" CodeBehind="Site1.master.cs"
Inherits="WebApplicationmasterStyle.Site1" %>
<!DOCTYPE html>
<html>
<head runat="server">
<link href="App_theme/StyleSheet1.css" rel="stylesheet" />
<title>My website</title>
<asp:ContentPlaceHolder ID="head" runat="server">
</asp:ContentPlaceHolder>
</head>
<body>
<form id="form1" runat="server">
<div class="header">My Master Page</div>
<div>
<a href="Default.aspx">Home</a>
<a href="About.aspx">Home</a>
<a href="Contact.aspx">Home</a>
</div>
<div class="content">
<asp:ContentPlaceHolder ID="ContentPlaceHolder1" runat="server">
</asp:ContentPlaceHolder>
</div>
<div class="footer">Copy right @2025</div>
</form>
</body>
</html>
StyleSheet1.css
body {
font-family:Arial,sans-serif;
background-color:#f4f4f4;
margin:0;
padding:0;
}
.header{
background-color:#4CAF50;
color:white;
padding:10px 0;
text-align:center;
}
.content{
padding:20px;
min-height:400px;
}
.menu{
background-color:#333;
overflow:hidden;
padding:10px;
text-align:center;
}
.menu a:hover{
background-color:#ddd;
color:black;
}
.footer{
background-color:#4CAF50;
color:white;
text-align:center;
padding:10px 0;
position:relative;
bottom:0;
width:100%
}

(add Web form with master page)
Default.aspx
<%@ Master Language="C#" AutoEventWireup="true" CodeBehind="Site1.master.cs"
Inherits="WebApplicationmasterStyle.Site1" %>
<!DOCTYPE html>
<html>
<head runat="server">
<link href="App_theme/StyleSheet1.css" rel="stylesheet" />
<title>My website</title>
<asp:ContentPlaceHolder ID="head" runat="server">
</asp:ContentPlaceHolder>
</head>
<body>
<form id="form1" runat="server">
<div class="header">My Master Page</div>
<div>
<a href="Default.aspx">Home</a>
<a href="About.aspx">Home</a>
<a href="Contact.aspx">Home</a>
</div>
<div class="content">
<asp:ContentPlaceHolder ID="ContentPlaceHolder1" runat="server">
</asp:ContentPlaceHolder>
</div>
<div class="footer">Copy right @2025</div>
</form>
</body>
</html>

C) Create a web application to demonstrate various states of ASP.NET Pages. (make webform)
StateDemo.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StateDemo.aspx.cs"
Inherits="WebApplicationStates.StateDemo" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<h2>ASP.NET State Management</h2>
<h3>1. ViewState</h3>
<asp:Label ID="lblView" runat="server" Text="0"></asp:Label><br />
<asp:Button ID="btnView" runat="server" Text="Increase (ViewState)" OnClick="btnView_Click" /><br />
<br />
<h3>2. HiddenField</h3>
<asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
<asp:Label ID="lblHidden" runat="server" Text="0"></asp:Label><br />
<asp:Button ID="btnHidden" runat="server" Text="Increase (HiddenField)" OnClick="btnHidden_Click" /><br />
<br />
<h3>3. QueryString</h3>
<asp:TextBox ID="txtQuery" runat="server"></asp:TextBox>
<asp:Button ID="btnQuery" runat="server" Text="Increase (QueryString)" OnClick="btnQuery_Click" /><br />
<asp:Label ID="lblQuery" runat="server"></asp:Label><br />
<br />
<h3>4. Session State</h3>
<asp:TextBox ID="txtSession" runat="server"></asp:TextBox>
<asp:Button ID="btnSession" runat="server" Text="Save in Session" OnClick="btnSession_Click" />
<asp:Label ID="lblSession" runat="server"></asp:Label><br />
<br />
<br />
<h3>5. Application State</h3>
<asp:Label ID="lblApp" runat="server"></asp:Label><br />
<br />
</div>
</form>
</body>
</html>

StateDemo.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebApplicationStates
{
public partial class StateDemo : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{
if (Application["Visitors"] == null)
Application["Visitors"] = 0;
lblApp.Text = "Total Visitors (Application State): " + Application["Visitors"].ToString();
if (!IsPostBack && Request.QueryString["name"] != null)
{
lblQuery.Text = "Received from QueryString: " + Request.QueryString["name"];
}
}
protected void btnView_Click(object sender, EventArgs e)
{
int count = 0;
if (ViewState["clicks"] != null)
count = (int)ViewState["clicks"];
count++;
lblView.Text = count.ToString();
ViewState["clicks"] = count;
}
protected void btnSession_Click(object sender, EventArgs e)
{
Session["username"] = txtSession.Text;
lblSession.Text = "Stored in Session: " + Session["username"];
}
protected void btnQuery_Click(object sender, EventArgs e)
{
Response.Redirect("StateDemo.aspx?name=" + txtQuery.Text);
}
protected void btnHidden_Click(object sender, EventArgs e)
{
int count = int.Parse(HiddenField1.Value) + 1;
HiddenField1.Value = count.ToString();
lblHidden.Text = "Hidden Field Value: " + count;
}
}
}

(Make global web form)
Global.asax.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
namespace WebApplicationStates
{
public class Global : System.Web.HttpApplication
{
protected void Application_Start(object sender, EventArgs e)
{
Application["Visitors"] = 0;
}
protected void Session_Start(object sender, EventArgs e)
{
Application["Visitors"] = (int)Application["Visitors"] + 1;
}
protected void Application_BeginRequest(object sender, EventArgs e)
{
}
protected void Application_AuthenticateRequest(object sender, EventArgs e)
{
}
protected void Application_Error(object sender, EventArgs e)
{
}
protected void Session_End(object sender, EventArgs e)
{
}
protected void Application_End(object sender, EventArgs e)
{
}
}
}

Practical 7
A) Create a web application to demonstrate the use of different types of Cookies. WebForm.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="Practical_7a_Cookies.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Cookie Demonstration</title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
<br /><br />
<b>Select the company</b><br /><br />
<asp:CheckBox ID="apple" runat="server" Text="apple" /><br />
<asp:CheckBox ID="dell" runat="server" Text="dell" /><br />
<asp:CheckBox ID="lenevo" runat="server" Text="lenevo" /><br />
<asp:CheckBox ID="acer" runat="server" Text="acer" /><br />
<asp:CheckBox ID="sony" runat="server" Text="sony" /><br />
<asp:CheckBox ID="hp" runat="server" Text="hp" /><br /><br />
<asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click"
/><br /><br />
<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
</div>
</form>
</body>
</html>

Webform.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Practical_7a_Cookies
{
public partial class WebForm1 : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{
HttpCookie c1 = new HttpCookie("creator");
c1.Value = "Hetvi Patel";
Response.Cookies.Add(c1);
String author = Response.Cookies["creator"].Value;
Label1.Text = author;
Response.Cookies["comp"].Expires = DateTime.Now.AddDays(-1);
}
protected void Button1_Click(object sender, EventArgs e)
{
Label3.Text = "";
if (apple.Checked)
Response.Cookies["comp"]["apple"] = "apple";
if (dell.Checked)
Response.Cookies["comp"]["dell"] = "dell";
if (lenevo.Checked)
Response.Cookies["comp"]["lenevo"] = "lenevo";
if (acer.Checked)
Response.Cookies["comp"]["acer"] = "acer";
if (sony.Checked)
if (sony.Checked)
Response.Cookies["comp"]["sony"] = "sony";
if (hp.Checked)
Response.Cookies["comp"]["hp"] = "hp";
if (Request.Cookies["comp"].Values.ToString() != null)
{
if (Request.Cookies["comp"]["apple"] != null)
Label3.Text += Request.Cookies["comp"]["apple"] + " ";
if (Request.Cookies["comp"]["dell"] != null)
Label3.Text += Request.Cookies["comp"]["dell"] + " ";
if (Request.Cookies["comp"]["lenevo"] != null)
Label3.Text += Request.Cookies["comp"]["lenevo"] + " ";
if (Request.Cookies["comp"]["acer"] != null)
Label3.Text += Request.Cookies["comp"]["acer"] + " ";
if (Request.Cookies["comp"]["sony"] != null)
Label3.Text += Request.Cookies["comp"]["sony"] + " ";
if (Request.Cookies["comp"]["wipro"] != null)
Label3.Text += Request.Cookies["comp"]["wipro"] + " ";
}
else Label3.Text = "Please select your choice";
Response.Cookies["comp"].Expires = DateTime.Now.AddDays(-1);
}
}
}

B) Create a web application to demonstrate Form Security and Windows Security with
proper Authentication and Authorization properties. 
WebForm1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Practical_7b_Formm.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Login Form</title>
</head>
<body>
<form id="form1" runat="server">
<div>
<table>
<tr>
<td>Username:</td>
<td>
<asp:TextBox ID="txtuser" runat="server" />
</td>
</tr>
<tr>
<td>Password:</td>
<td>
<asp:TextBox ID="txtpwd" runat="server" TextMode="Password" />
</td>
</tr>
<tr>
<td>Remember Me:</td>
<td>
<asp:CheckBox ID="chkrem" runat="server" />
</td>
</tr>
<tr>
<td></td>
<td>
<asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
</td>
</tr>
</table>
</div>
</form>
</body>
</html>

WebForm1.aspx.cs
using System;
using System.Web.Security;
namespace Practical_7b_Formm
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected bool authenticate(string uname, string pass)
        {
            if (uname == "Iqra" && pass == "iqra123") return true;
            if (uname == "Rimsha" && pass == "rimsha123") return true;
            if (uname == "Hetvi" && pass == "hetvi123") return true;
            return false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (authenticate(txtuser.Text, txtpwd.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(txtuser.Text, chkrem.Checked);
                Response.Redirect("WebForm2.aspx");
            }
            else
            {
                Session["Username"] = txtuser.Text;
                Response.Redirect("WebForm2.aspx");
                Response.Write("Invalid user name or password");
            }
        }
    }
}

WebForm2.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Practical_7b_Formm.WebForm2" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
</form>
</body>
</html>

WebForm2.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Practical_7b_Formm
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Label1.Text = Session["Username"].ToString();
            }
        }
    }
}

Practical 9
A) Create a web application to demonstrate use of GridView button column and GridView
events along with paging and sorting
WebForm1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="Prac9a.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>GridView XML Example</title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:GridView ID="GridView1" runat="server" >
</asp:GridView>
<br />
<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XMLFile1.xml"></asp:XmlDataSource>
</div>
</form>
</body>
</html>

(Take xml file)
XMLFile1.xml
<Employees>
<Employee>
<ID>1</ID>
<Name>Iqra</Name>
<Position>Developer</Position>
</Employee>
<Employee>
<ID>2</ID>
<Name>Hetvi</Name>
<Position>Designer</Position>
</Employee>
<Employee>
<ID>3</ID>
<Name>Rimsha</Name>
<Position>Manager</Position>
</Employee>
</Employees>

WebForm1.aspx.cs
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Prac9a
{
public partial class WebForm1 : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{
if (!IsPostBack)
{
DataSet ds = new DataSet();
string xmlPath = Server.MapPath("~/XMLFile1.xml");
ds.ReadXml(xmlPath);
if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
{
GridView1.DataSource = ds.Tables[0];
GridView1.DataBind();
}
else
{
Response.Write("No data loaded from XML");
}
}
}
}
}

B) Create a web application to demonstrate data binding using DetailsView and FormViewControl. 
WebForm.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="DetailsView.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="XmlDataSource1" AutoGenerateRows="True">
</asp:DetailsView>
<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XMLFile1.xml" XPath="Products/Product">
</asp:XmlDataSource>
</div>
</form>
</body>
</html>

XMLFile1.XML
<Products>
<Product
Id="1" ProductName="Chai" SupplierId="1" UnitPrice="18.00" Package="10 boxes x 20 bags"
IsDiscontinued="false" />
</Products>

Practical 10
A) Create a web application to demonstrate JS Bootstrap Button. Webform.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="Practical7a.WebForm1" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384- sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
<button type="button" class="btn btn-primary">Primary</button>
<button type="button" class="btn btn-secondary">Secondary</button>
<button type="button" class="btn btn-success">Success</button>
<button type="button" class="btn btn-danger">Danger</button>
<button type="button" class="btn btn-warning">Warning</button>
<button type="button" class="btn btn-info">Info</button>
<button type="button" class="btn btn-light">Light</button>
<button type="button" class="btn btn-dark">Dark</button>
<button type="button" class="btn btn-link">Link</button>
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
integrity="sha384- FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>

B) Create a web application to demonstrate use of various Ajax controls. 
Webform1.aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
Inherits="Prac10b.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
</div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<br />
<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
<br />
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="1500">
<ProgressTemplate>
plz. wait.....<br />
<asp:Image ID="Image1" runat="server" Height="60px"
ImageUrl="~/Images/download.png" Width="81px" />
</ProgressTemplate>
</asp:UpdateProgress>
<br />
<br />
<br />
<br />
<br />
<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
<br />
<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
<br />
<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
<br />
<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</form>
</body>
</html>

WebForm.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Prac10b
{
public partial class WebForm1 : System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)
{
}
protected void Button1_Click(object sender, EventArgs e)
{
System.Threading.Thread.Sleep(5000);
Label1.Text = TextBox1.Text + TextBox2.Text;
}
protected void Button2_Click(object sender, EventArgs e)
{
System.Threading.Thread.Sleep(5000);
Label2.Text = TextBox3.Text + TextBox4.Text;
}
}
}

A) Store 3 objects of the furniture class having 3 data members(name, manufracturer. and cost) in 3 session objects.Display a panel to include a listbox displaying the names of all three furniture objects and a button named MoreInformation. On click of the button retrieve the selected object (from listbox) information and display it

B) Create a simple web page with various sever controls to demonstrate setting and use of their properties. (Example: AutoPostBack)
1. On click of a button control display the selected items from the listbox in a textbox. Also in the same webpage display the name of the selected item from the DropDownListl in a label. Also change the font size of the same label according to the font size selected from the Dropdownlist2.
2. Display Image control for photo.
3. Check Boxes provides special formatting (viz. underline, bold, italic) and Radio Buttons provides color for label.
4. Use of AutoPostBack property.

C) Create Web Form to demonstrate use of Ad rotator Control with five advertisements. Also demonstrate how keyword filter works.

D) Design an asp.net webpage with 2 groups of Radio Buttons, DropDownList, label and TextBox to perform the following operations:-
1. On click of Radio Buttons each at the same time from two different groups, change the font- size and font-face of the
label's Text.
2. Also on the same webpage show that, on selecting a country name from the dropdown list, its respective country code gets displayed in a box

