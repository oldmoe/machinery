module Machinery
  module Extensions #:nodoc:

    ##
    # Installs core class extensions in a well-defined manner.
    def install_extensions!
      if self.const_defined?(:Extensions)
        if (exts = self.const_get(:Extensions)).is_a?(Module)
          mods = exts.constants.select { |const| exts.const_get(const).is_a?(Module) }
          mods.each { |mod| Kernel.const_get(mod).send(:include, exts.const_get(mod)) }
        end
      end
    end
  end
end
