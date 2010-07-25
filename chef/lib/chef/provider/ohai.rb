#
# Author:: Michael Leianrtas (<mleinartas@gmail.com>)
# Copyright:: Copyright (c) 2010 Michael Leinartas
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'ohai'

class Chef
  class Provider
    class Ohai < Chef::Provider

      def load_current_resource
        true
      end

      def action_reload
        ohai = ::Ohai::System.new
        ohai.all_plugins
        node.automatic_attrs = ohai.data
        node.save
      end
    end
  end
end
