using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrudOperationDemoApp
{
    public partial class Employee : System.Web.UI.Page
    {
        //SqlConnection myCon = new SqlConnection(@"Data Source = NAZMUL-PC\MsSQL2K14; Initial Catalog = CustomerDB; Integrated Security = true");
        SqlConnection myCon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EmployeeTableGridView();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                myCon.Open();
                SqlCommand sqlcmd = new SqlCommand("SaveUpdateEmployeeProc", myCon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@EmployeeId", (EmployeeId.Value == "" ? 0 : Convert.ToInt32(EmployeeId.Value)));
                sqlcmd.Parameters.AddWithValue("@EmployeeName", txtName.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@EmployeeDepartment", txtDepartment.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@EmployeeAdress", txtAdress.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@EmployeeContactNo", txtCotactNo.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@EmployeeSalary", txtSalary.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@SchooleId", 1);
                int t = sqlcmd.ExecuteNonQuery();
                if (t == 1)
                {
                    lblSeuccessMessage.Text = "Save successful.";
                    lblSeuccessMessage.Visible = true;
                    clear();
                }
                myCon.Close();

                gvEployee.EditIndex = -1;
                EmployeeTableGridView();
            }
            catch (Exception ex)
            {

                lblEroreMessage.Text = "Not save data" + ex.Message;
            }
        }

        void clear()
        {
            txtName.Text = "";
            txtDepartment.Text = "";
            txtAdress.Text = "";
            txtSalary.Text = "";
            txtCotactNo.Text = "";
        }
        void EmployeeTableGridView()
        {
            myCon.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("GetEmployeeTable", myCon);
            sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet dtbl = new DataSet();
            sqlDA.Fill(dtbl);
            myCon.Close();
            DataTable dt= dtbl.Tables[0];
            gvEployee.DataSource = dt;
            gvEployee.DataBind();
        }

        protected void gridviewRowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEployee.EditIndex = e.NewEditIndex;
            EmployeeTableGridView();
        }
        protected void GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = gvEployee.Rows[e.RowIndex].FindControl("textRowEmployeeId") as Label;
            TextBox EmployeeName = gvEployee.Rows[e.RowIndex].FindControl("textRowEmployeeName") as TextBox;
            TextBox textDepartment = gvEployee.Rows[e.RowIndex].FindControl("textRowEmployeeDepartment") as TextBox;
            TextBox textEmployeeAdress = gvEployee.Rows[e.RowIndex].FindControl("textRowEmployeeAdress") as TextBox;
            TextBox textEmployeeContactNo = gvEployee.Rows[e.RowIndex].FindControl("textRowEmployeeContactNo") as TextBox;
            TextBox textEmployeeSalary = gvEployee.Rows[e.RowIndex].FindControl("textRowEmployeeSalary") as TextBox;


            int employeeId = Convert.ToInt32(id.Text);
            string name = EmployeeName.Text;
            string department = textDepartment.Text;
            string adress = textEmployeeAdress.Text;
            string contactNo = textEmployeeContactNo.Text;
            string salary = textEmployeeSalary.Text;

            //if (myCon.State == ConnectionState.Closed)
            myCon.Open();
            SqlCommand sqlcmd = new SqlCommand("SaveUpdateEmployeeProc", myCon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@EmployeeId", employeeId);
            sqlcmd.Parameters.AddWithValue("@EmployeeName", name.Trim());
            sqlcmd.Parameters.AddWithValue("@EmployeeDepartment", department.Trim());
            sqlcmd.Parameters.AddWithValue("@EmployeeAdress", adress.Trim());
            sqlcmd.Parameters.AddWithValue("@EmployeeContactNo", contactNo.Trim());
            sqlcmd.Parameters.AddWithValue("@EmployeeSalary", salary.Trim());
            sqlcmd.Parameters.AddWithValue("@SchooleId", 1);
            sqlcmd.ExecuteNonQuery();
            myCon.Close();

            gvEployee.EditIndex = -1;
            EmployeeTableGridView();

            //int index = gvEployee.EditIndex;
            //GridViewRow row = gvEployee.Rows[index];
            //lblSeuccessMessage.Text = "Updated record " + row.Cells[1].Text + ".";

            //EmployeeTableGridView();

        }
        protected void gvCompanies_RowCommand(object sender, GridViewUpdateEventArgs e)
        {
            //Label id = gvEployee.Rows[e.RowIndex].FindControl("EmployeeIdRow.value") as Label;
           
            //TextBox EmployeeId = gvEployee.Rows[e.RowIndex].FindControl("textRowEmployeeId") as TextBox;
            //TextBox EmployeeName = gvEployee.Rows[e.RowIndex].FindControl("textRowEmployeeName") as TextBox;
            //TextBox textSalary = gvEployee.Rows[e.RowIndex].FindControl("textRowSalary") as TextBox;
            //TextBox textDepartment = gvEployee.Rows[e.RowIndex].FindControl("textRowDepartment") as TextBox;

            //int employeeId = Convert.ToInt32(EmployeeId.Text);
            //string named = EmployeeName.Text;
            //string aSalary = textSalary.Text;
            //string aDepartment = textDepartment.Text;

            //if (sqlcon.State == ConnectionState.Closed)
            //    sqlcon.Open();
            //SqlCommand sqlcmd = new SqlCommand("EmployeeCreateOrUpdate", sqlcon);
            //sqlcmd.CommandType = CommandType.StoredProcedure;
            //sqlcmd.Parameters.AddWithValue("@EmployeeId", (EmployeeId.Text == "" ? 0 : Convert.ToInt32(employeeId)));
            //sqlcmd.Parameters.AddWithValue("@EmployeeName", named.Trim());
            //sqlcmd.Parameters.AddWithValue("@Salary", aSalary.Trim());
            //sqlcmd.Parameters.AddWithValue("@Department", aDepartment.Trim());
            //sqlcmd.ExecuteNonQuery();
            //sqlcon.Close();

            //EmployeeTableGridView();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            if (myCon.State == ConnectionState.Closed)
                myCon.Open();
            SqlDataAdapter Da = new SqlDataAdapter("DeleteEmployeeById", myCon);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@Id", id);
            DataTable dtbl = new DataTable();
            Da.Fill(dtbl);
            myCon.Close();
            EmployeeTableGridView();
            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Are you sure you want to delete this item?');", true);
        }

        protected void gvEployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEployee.EditIndex = -1;
            EmployeeTableGridView();
        }
        
        protected void btnReport_Click(object sender, EventArgs e)
        {
            myCon.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("GetEmployeeTable", myCon);
            sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet dtbl = new DataSet();
            sqlDA.Fill(dtbl);
            myCon.Close();
            DataTable dt = dtbl.Tables[0];

            ReportViewer1.LocalReport.DataSources.Clear();
            ReportDataSource source = new ReportDataSource("EmployeeDataSet", dt);
            ReportViewer1.LocalReport.ReportPath = "Employee.rdlc";
            ReportViewer1.LocalReport.DataSources.Add(source);
            ReportViewer1.LocalReport.Refresh();
        }
    }
}