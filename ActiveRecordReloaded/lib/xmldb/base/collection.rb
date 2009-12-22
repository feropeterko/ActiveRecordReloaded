require 'xmldb/base/resource'
require 'xmldb/base/configurable'

module XMLDB
  module Base
    
    class Collection < Configurable
      
      ##
      # Initialize 
      def initialize(c)
        @obj = c
        
        if (@obj == nil)
          raise 'Collection initialised with empty object'
        end
        
      end 
      
      ##
      # Releases all resources consumed by the Collection. 
      def close() 
        @obj.close()
      end 
      
      ##
      # Creates a new unique ID within the context of the Collection
      def createId() 
        resource = @obj.createId()
        return XMLDB::Base::Resource.getInstance(resource)
      end 
      
      ##
      # Creates a new empty Resource with the provided id. 
      def createResource(id, type = '')
        return XMLDB::Base::Resource.getInstance(@obj.createResource(id, type))
      end 
      
      ##
      # Returns a Collection instance for the requested child collection if it exists.
      def getChildCollection(name)
        return XMLDB::Base::Collection.getInstance(@obj.getChildCollection(name))
      end 
      
      ##
      # Returns the number of child collections under this Collection or 0 if no child collections exist.
      def getChildCollectionCount()
        @obj.getChildCollectionCount()
      end 
      
      ##
      # Returns the name associated with the Collection instance.
      def getName()
        @obj.getName()
      end 
      
      ##
      # Returns the parent collection for this collection or null if no parent collection exists.
      def getParentCollection() 
        return XMLDB::Base::Collection.getInstance(@obj.getParentCollection())
      end 
      
      ##
      # Retrieves a Resource from the database. 
      def getResource(id) 
        return XMLDB::Base::Resource.getInstance(@obj.getResource(id))
      end 
      
      ##
      # Returns the number of resources currently stored in this collection or 0 if the collection is empty.
      def getResourceCount() 
        @obj.getResourceCount() 
      end 
      
      ##
      # Returns a Service instance for the requested service name and version. 
      def getService(name, version) 
        @obj.getService(name, version) 
      end 
      
      ##
      # Provides a list of all services known to the collection. 
      def getServices() 
        @obj.getServices() 
      end 
      
      ##
      # Returns true if the Collection is open false otherwise. 
      def isOpen()
        @obj.isOpen()
      end 
      
      ##
      # Returns a list of collection names naming all child collections of the current collection. 
      def listChildCollections() 
        @obj.listChildCollections() 
      end
      
      ##
      # Returns a list of the ids for all resources stored in the collection.
      def listResources() 
        @obj.listResources() 
      end
      
      ##
      # Removes the Resource from the database.
      def removeResource(res) 
        @obj.removeResource(res)
      end
      
      ##
      # Stores the provided resource into the database.
      def storeResource(res) 
        @obj.storeResource(res)
      end
      
      ##
      # Get instance of wrapping class from wrapped class
      def Collection.getInstance(i) 
        return Collection.new(i)
      end
      
    end
  end
end
