class VulnerabilitiesController < ApplicationController
    def index
      @vulnerabilities = Vulnerability.all
    end
end
  