Google AdPlanner List Generator
=========

## Installation & Usage

### Setup

Make sure you have a recent version of Ruby, RubyGems and Xcode developer tools installed. Install `watir-webdriver` and `json`. 

```
sudo gem install watir-webdriver --no-ri --no-rdoc
sudo gem install json --no-ri --no-rdoc
```
[Download ChromeDriver](http://code.google.com/p/chromedriver/downloads/detail?name=chromedriver_mac_23.0.1240.0.zip) and place it in `/usr/bin`

### Usage
Put your Google credentials into `GAP.rb` in the variables `google_username` and `google_password`. Run the script. If the website hangs, you can restart the script where it left off, by setting a range on `countries.each` by making it `countries[54..300].each`.

## License
Copyright (c) 2012 Kulpreet Chilana

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
