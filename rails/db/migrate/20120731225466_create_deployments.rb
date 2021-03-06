# Copyright 2013, Dell
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.integer     :state,       null: false, default: Deployment::PROPOSED
      t.string      :name,        null: false, index: :unique
      t.string      :description, null: true
      t.boolean     :system,      null: false, default: false
      t.references  :parent
      t.timestamps
    end
  end

end
