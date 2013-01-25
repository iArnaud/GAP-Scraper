#!/usr/bin/env ruby

require "watir-webdriver"

google_username = ""
google_password = ""

#Browser Setup and Login
browser = Watir::Browser.new :chrome
browser.goto"http://www.google.com/adplanner/"
browser.text_field(:name => "Email").set google_username
browser.text_field(:name => "Passwd").set google_password
browser.button(:name => "signIn").click
browser.goto"http://www.google.com/adplanner/#placementSearch"
until browser.div(:id => "gwt-debug-startSearchButton").exists? do
  sleep 0.5
end
browser.div(:id => "gwt-debug-startSearchButton").click

#List Settings
browser.div(:class => "gux-pgt-page-size-combo").click 
browser.td(:text => "250").click #Set number of items to 250
browser.div(:id => "gwt-debug-OpenContentCategories").click
browser.checkbox(:id => "gwt-debug-catid-16-checkbox-input").click #Include "News" category
browser.div(:text => "OK").click
browser.div(:id => "gwt-debug-OpenExcludeContentCategories").click
browser.span(:text => "News").click
browser.checkbox(:id => "gwt-debug-catid-63-checkbox-input").click #Exclude "Weather" category
browser.checkbox(:id => "gwt-debug-catid-507-checkbox-input").click #Exclude "Gossip/Tabloid News" category
browser.div(:text => "OK").click
browser.div(:class => "pt-col-reach").click #Sort by "Reach"



browser.div(:id => "gwt-debug-OpenGeography").click
countries = browser.div(:id => "gwt-debug-Geography-Popup").select_list(:class => "gwt-ListBox").options

countries.each do |country| #countries[54..300].each can be used for any range when the website hangs
  title = country.text
  browser.div(:id => "gwt-debug-Geography-Popup").select_list(:class => "gwt-ListBox").select(country.text)
  browser.div(:id => "gwt-debug-Geography-Ok").click
  until browser.checkbox(:id=>"gwt-uid-70").enabled? do
    sleep 0.5
  end
  browser.checkbox(:id=>"gwt-uid-70").click
  until browser.checkbox(:id=>"gwt-uid-70").set? do
    sleep 0.5
  end
  browser.div(:id => "gwt-debug-Add-Selected-To-Plist-View").click
  browser.div(:id => "gwt-debug-Add-Selected-To-Plist-View-cascade-item4").click
  browser.text_field(:id => "gwt-debug-plistNameTextBox").set title
  browser.select_list(:id => "gwt-debug-plistCountrySelect").select "All regions"
  browser.div(:class => "adp-dialog-FooterPanel").div(:class => "defaultButton").click
  until browser.checkbox(:id=>"gwt-uid-70").enabled? do
    sleep 0.5
  end
  puts "Created list for " + title + "."
  browser.div(:id => "gwt-debug-OpenGeography").click
end

browser.close
exit