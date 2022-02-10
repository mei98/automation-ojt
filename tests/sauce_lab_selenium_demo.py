from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium import webdriver
import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By


class UploadFile(unittest.TestCase):

    def setUp(self):
        
        options = ChromeOptions()
        options.browser_version = '96'
        options.platform_name = 'Windows 10'
        
        sauce_options = {'name':'Third Test'}
        options.set_capability('sauce:options', sauce_options)
        
        sauce_url=  "https://oauth-meimei.havi-0824a:027e7bf0-4221-4424-ade3-9d3d3b7691ad@ondemand.apac-southeast-1.saucelabs.com:443/wd/hub"          
        self.driver = webdriver.Remote(command_executor= sauce_url, options=options)

    def test_upload_file(self):
        
        driver = self.driver
        driver.get("https://www.w3schools.com/howto/howto_html_file_upload_button.asp")
        self.assertIn("Upload Button", driver.title)
        
        element = driver.find_element(By.CSS_SELECTOR, "#myFile")
        element.send_keys("C://Users/meimei/Desktop/background/Eren.jpg")
        fileName = driver.find_element(By.CSS_SELECTOR,"#myFile").get_attribute('value') 
        assert "Eren.jpg" in fileName
    
    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main()