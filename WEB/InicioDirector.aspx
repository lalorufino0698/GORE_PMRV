﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDirector.master" AutoEventWireup="true" CodeFile="InicioDirector.aspx.cs" Inherits="InicioDirector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="right_col" role="main">
        <div class="">
            <div class="row" style="display: inline-block;">
                <div class="top_tiles">
                    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 ">
                        <div class="tile-stats">
                            <div class="icon"><i class="fa fa-caret-square-o-right"></i></div>
                            <div class="count">179</div>
                            <h3>New Sign ups</h3>
                            <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                    </div>
                    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 ">
                        <div class="tile-stats">
                            <div class="icon"><i class="fa fa-comments-o"></i></div>
                            <div class="count">179</div>
                            <h3>New Sign ups</h3>
                            <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                    </div>
                    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 ">
                        <div class="tile-stats">
                            <div class="icon"><i class="fa fa-sort-amount-desc"></i></div>
                            <div class="count">179</div>
                            <h3>New Sign ups</h3>
                            <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                    </div>
                    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 ">
                        <div class="tile-stats">
                            <div class="icon"><i class="fa fa-check-square-o"></i></div>
                            <div class="count">179</div>
                            <h3>New Sign ups</h3>
                            <p>Lorem ipsum psdea itgum rixt.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Transaction Summary <small>Weekly progress</small></h2>
                            <div class="filter">
                                <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                    <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="col-md-9 col-sm-12 ">
                                <div class="demo-container" style="height: 280px">
                                    <div id="chart_plot_02" class="demo-placeholder"></div>
                                </div>
                                <div class="tiles">
                                    <div class="col-md-4 tile">
                                        <span>Total Sessions</span>
                                        <h2>231,809</h2>
                                        <span class="sparkline11 graph" style="height: 160px;">
                                            <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                                        </span>
                                    </div>
                                    <div class="col-md-4 tile">
                                        <span>Total Revenue</span>
                                        <h2>$231,809</h2>
                                        <span class="sparkline22 graph" style="height: 160px;">
                                            <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                                        </span>
                                    </div>
                                    <div class="col-md-4 tile">
                                        <span>Total Sessions</span>
                                        <h2>231,809</h2>
                                        <span class="sparkline11 graph" style="height: 160px;">
                                            <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                                        </span>
                                    </div>
                                </div>

                            </div>

                            <div class="col-md-3 col-sm-12 ">
                                <div>
                                    <div class="x_title">
                                        <h2>Top Profiles</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">Settings 1</a>
                                                    <a class="dropdown-item" href="#">Settings 2</a>
                                                </div>
                                            </li>
                                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <ul class="list-unstyled top_profiles scroll-view">
                                        <li class="media event">
                                            <a class="pull-left border-aero profile_thumb">
                                                <i class="fa fa-user aero"></i>
                                            </a>
                                            <div class="media-body">
                                                <a class="title" href="#">Ms. Mary Jane</a>
                                                <p><strong>$2300. </strong>Agent Avarage Sales </p>
                                                <p>
                                                    <small>12 Sales Today</small>
                                                </p>
                                            </div>
                                        </li>
                                        <li class="media event">
                                            <a class="pull-left border-green profile_thumb">
                                                <i class="fa fa-user green"></i>
                                            </a>
                                            <div class="media-body">
                                                <a class="title" href="#">Ms. Mary Jane</a>
                                                <p><strong>$2300. </strong>Agent Avarage Sales </p>
                                                <p>
                                                    <small>12 Sales Today</small>
                                                </p>
                                            </div>
                                        </li>
                                        <li class="media event">
                                            <a class="pull-left border-blue profile_thumb">
                                                <i class="fa fa-user blue"></i>
                                            </a>
                                            <div class="media-body">
                                                <a class="title" href="#">Ms. Mary Jane</a>
                                                <p><strong>$2300. </strong>Agent Avarage Sales </p>
                                                <p>
                                                    <small>12 Sales Today</small>
                                                </p>
                                            </div>
                                        </li>
                                        <li class="media event">
                                            <a class="pull-left border-aero profile_thumb">
                                                <i class="fa fa-user aero"></i>
                                            </a>
                                            <div class="media-body">
                                                <a class="title" href="#">Ms. Mary Jane</a>
                                                <p><strong>$2300. </strong>Agent Avarage Sales </p>
                                                <p>
                                                    <small>12 Sales Today</small>
                                                </p>
                                            </div>
                                        </li>
                                        <li class="media event">
                                            <a class="pull-left border-green profile_thumb">
                                                <i class="fa fa-user green"></i>
                                            </a>
                                            <div class="media-body">
                                                <a class="title" href="#">Ms. Mary Jane</a>
                                                <p><strong>$2300. </strong>Agent Avarage Sales </p>
                                                <p>
                                                    <small>12 Sales Today</small>
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


</asp:Content>

