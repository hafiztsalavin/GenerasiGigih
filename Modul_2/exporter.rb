class GenericExporter
    # abstract method
    # abstrac method wajib/harus di overide(timpa)
    def export
        raise NotImplentedError, 'You must implement the export'
    end
end

class PdfExporter < GenericExporter
    def export
        puts "Export to .pdf format"
    end
end

class XlsExporter < GenericExporter
    def export
        puts "Export to .xls format"
    end
end
