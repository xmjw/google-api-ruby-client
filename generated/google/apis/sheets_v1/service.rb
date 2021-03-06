# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module SheetsV1
      # Google Sheets API
      #
      # An API for reading and modifying Google Sheets.
      #
      # @example
      #    require 'google/apis/sheets_v1'
      #
      #    Sheets = Google::Apis::SheetsV1 # Alias the module
      #    service = Sheets::SheetsService.new
      #
      # @see 
      class SheetsService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://sheets.googleapis.com/', '')
        end
        
        # Returns the spreadsheet at the given id.
        # The caller must specify the spreadsheet ID.
        # By default, data within grids will not be returned.
        # You can include grid data one of two ways: specify a field mask listing
        # your desired fields (using the ?fields URL parameter in HTTP,
        # or FieldMaskContext.response_mask in the request extensions in an RPC), or
        # by setting the 'includeGridData' parameter to true.  If a field mask is
        # set, the 'includeGridData' parameter is ignored.
        # For large spreadsheets, it is recommended to retrieve only the specific
        # fields of the spreadsheet that you want.
        # To retrieve only subsets of the spreadsheet, use the ?range URL
        # parameter. Multiple ranges can be specified.  Limiting the range will
        # return only the portions of the spreadsheet that intersect the requested
        # ranges. Ranges are specified using A1 notation.
        # @param [String] spreadsheet_id
        #   The spreadsheet to request.
        # @param [Array<String>, String] ranges
        #   The ranges to retrieve from the spreadsheet.
        # @param [Boolean] include_grid_data
        #   True if grid data should be returned.
        #   This parameter is ignored if a field mask was set in the request.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV1::Spreadsheet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV1::Spreadsheet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_spreadsheet(spreadsheet_id, ranges: nil, include_grid_data: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1/spreadsheets/{spreadsheetId}', options)
          command.response_representation = Google::Apis::SheetsV1::Spreadsheet::Representation
          command.response_class = Google::Apis::SheetsV1::Spreadsheet
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['ranges'] = ranges unless ranges.nil?
          command.query['includeGridData'] = include_grid_data unless include_grid_data.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Applies one or more updates to the spreadsheet.
        # Each request is validated before being applied. If any
        # request is not valid then the entire request will fail and nothing
        # will be applied.
        # Some requests have "replies" to give you some information about how
        # they applied. The replies will mirror the requests.  For example,
        # if you applied 4 updates and the 3rd one had a reply, then the
        # response will have 2 empty replies, the actual reply, and another empty
        # reply, in that order.
        # Due to the collaborative nature of spreadsheets, it is not guaranteed that
        # the spreadsheet will reflect exactly your changes after this completes,
        # however it is guaranteed that all the updates in the request will be
        # applied atomically. Your changes may be altered with respect to
        # collaborator changes. If there are no collaborators, the spreadsheet
        # should reflect your changes.
        # @param [String] spreadsheet_id
        #   The spreadsheet to apply the updates to.
        # @param [Google::Apis::SheetsV1::BatchUpdateSpreadsheetRequest] batch_update_spreadsheet_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV1::BatchUpdateSpreadsheetResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV1::BatchUpdateSpreadsheetResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_update_spreadsheet(spreadsheet_id, batch_update_spreadsheet_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1/spreadsheets/{spreadsheetId}:batchUpdate', options)
          command.request_representation = Google::Apis::SheetsV1::BatchUpdateSpreadsheetRequest::Representation
          command.request_object = batch_update_spreadsheet_request_object
          command.response_representation = Google::Apis::SheetsV1::BatchUpdateSpreadsheetResponse::Representation
          command.response_class = Google::Apis::SheetsV1::BatchUpdateSpreadsheetResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets values in a range of a spreadsheet.
        # The caller must specify the spreadsheet ID, range, and valueInputOption.
        # @param [String] spreadsheet_id
        #   The id of the spreadsheet to update.
        # @param [String] range
        #   The A1 notation of the values to update.
        # @param [Google::Apis::SheetsV1::ValueRange] value_range_object
        # @param [String] value_input_option
        #   How the input data should be interpreted.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_spreadsheet_value(spreadsheet_id, range, value_range_object = nil, value_input_option: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:put, 'v1/spreadsheets/{spreadsheetId}/values/{range}', options)
          command.request_representation = Google::Apis::SheetsV1::ValueRange::Representation
          command.request_object = value_range_object
          command.response_representation = Google::Apis::SheetsV1::Empty::Representation
          command.response_class = Google::Apis::SheetsV1::Empty
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.params['range'] = range unless range.nil?
          command.query['valueInputOption'] = value_input_option unless value_input_option.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns one or more ranges of values from a spreadsheet.
        # The caller must specify the spreadsheet ID and one or more ranges.
        # @param [String] spreadsheet_id
        #   The id of the spreadsheet to retrieve data from.
        # @param [String] date_time_render_option
        #   How dates, times, and durations should be represented in the output.
        #   This is ignored if valueRenderOption is FORMATTED_VALUE.
        # @param [String] value_render_option
        #   How values should be represented in the output.
        # @param [Array<String>, String] ranges
        #   The A1 notation of the values to retrieve.
        # @param [String] major_dimension
        #   The major dimension that results should use.
        #   For example, if the spreadsheet data is: A1=1,B1=2,A2=3,B2=4,
        #   then requesting range=A1:B2,majorDimension=ROWS will return [[1,2],[3,4]],
        #   whereas requesting range=A1:B2,majorDimension=COLUMNS will return
        #   [[1,3],[2,4]].
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV1::BatchGetValuesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV1::BatchGetValuesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_spreadsheet_value_get(spreadsheet_id, date_time_render_option: nil, value_render_option: nil, ranges: nil, major_dimension: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1/spreadsheets/{spreadsheetId}/values:batchGet', options)
          command.response_representation = Google::Apis::SheetsV1::BatchGetValuesResponse::Representation
          command.response_class = Google::Apis::SheetsV1::BatchGetValuesResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['dateTimeRenderOption'] = date_time_render_option unless date_time_render_option.nil?
          command.query['valueRenderOption'] = value_render_option unless value_render_option.nil?
          command.query['ranges'] = ranges unless ranges.nil?
          command.query['majorDimension'] = major_dimension unless major_dimension.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a range of values from a spreadsheet.
        # The caller must specify the spreadsheet ID and a range.
        # @param [String] spreadsheet_id
        #   The id of the spreadsheet to retrieve data from.
        # @param [String] range
        #   The A1 notation of the values to retrieve.
        # @param [String] date_time_render_option
        #   How dates, times, and durations should be represented in the output.
        #   This is ignored if the valueRenderOption option is FORMATTED_VALUE.
        # @param [String] value_render_option
        #   How values should be represented in the output.
        # @param [String] major_dimension
        #   The major dimension that results should use.
        #   For example, if the spreadsheet data is: A1=1,B1=2,A2=3,B2=4,
        #   then requesting range=A1:B2,majorDimension=ROWS will return [[1,2],[3,4]],
        #   whereas requesting range=A1:B2,majorDimension=COLUMNS will return
        #   [[1,3],[2,4]].
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV1::ValueRange] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV1::ValueRange]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_spreadsheet_value(spreadsheet_id, range, date_time_render_option: nil, value_render_option: nil, major_dimension: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1/spreadsheets/{spreadsheetId}/values/{range}', options)
          command.response_representation = Google::Apis::SheetsV1::ValueRange::Representation
          command.response_class = Google::Apis::SheetsV1::ValueRange
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.params['range'] = range unless range.nil?
          command.query['dateTimeRenderOption'] = date_time_render_option unless date_time_render_option.nil?
          command.query['valueRenderOption'] = value_render_option unless value_render_option.nil?
          command.query['majorDimension'] = major_dimension unless major_dimension.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets values in a range of a spreadsheet.
        # The caller must specify the spreadsheet ID, valueInputOption, and one
        # or more ValueRanges.
        # @param [String] spreadsheet_id
        #   The id of the spreadsheet to update.
        # @param [Google::Apis::SheetsV1::BatchUpdateValuesRequest] batch_update_values_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_update_values(spreadsheet_id, batch_update_values_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1/spreadsheets/{spreadsheetId}/values:batchUpdate', options)
          command.request_representation = Google::Apis::SheetsV1::BatchUpdateValuesRequest::Representation
          command.request_object = batch_update_values_request_object
          command.response_representation = Google::Apis::SheetsV1::Empty::Representation
          command.response_class = Google::Apis::SheetsV1::Empty
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Copies a single sheet from a spreadsheet to another spreadsheet.
        # Returns the properties of the newly created sheet.
        # @param [String] spreadsheet_id
        #   The id of the spreadsheet containing the sheet to copy.
        # @param [Fixnum] sheet_id
        #   The ID of the sheet to copy.
        # @param [Google::Apis::SheetsV1::CopySheetToAnotherSpreadsheetRequest] copy_sheet_to_another_spreadsheet_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV1::SheetProperties] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV1::SheetProperties]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def copy_spreadsheet_sheet_to(spreadsheet_id, sheet_id, copy_sheet_to_another_spreadsheet_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1/spreadsheets/{spreadsheetId}/sheets/{sheetId}:copyTo', options)
          command.request_representation = Google::Apis::SheetsV1::CopySheetToAnotherSpreadsheetRequest::Representation
          command.request_object = copy_sheet_to_another_spreadsheet_request_object
          command.response_representation = Google::Apis::SheetsV1::SheetProperties::Representation
          command.response_class = Google::Apis::SheetsV1::SheetProperties
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.params['sheetId'] = sheet_id unless sheet_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
