env = "dev"
bastion_cidr = ["172.31.15.57/32"]
default_vpc_id = "vpc-0f5c2199ac552becb"
default_vpc_cidr ="172.31.0.0/16"
default_vpc_rtid = "rtb-0001996bd71440d5b"
kms_arn = "arn:aws:kms:us-east-1:838594267872:key/635d16bd-ca1e-4957-ab88-1a68a3cd1cb7"
vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    subnets = {
       public = {
         name = "public"
         cidr_block =["10.0.0.0/24" , "10.0.1.0/24"]
         azs = ["us-east-1a", "us-east-1b"]
       }
      web = {
        name = "web"
        cidr_block =["10.0.2.0/24" , "10.0.3.0/24"]
        azs = ["us-east-1a", "us-east-1b"]
      }
      app = {
        name = "app"
        cidr_block =["10.0.4.0/24" , "10.0.5.0/24"]
        azs = ["us-east-1a", "us-east-1b"]
      }
      db = {
        name = "db"
        cidr_block =["10.0.6.0/24" , "10.0.7.0/24"]
        azs = ["us-east-1a", "us-east-1b"]
      }
    }
  }
}

app = {
  frontend = {
    name             = "frontend"
    instance_type    = "t3.small"
    subnet_name      = "web"
    allow_app_cidr   = "public"
    desired_capacity = 2
    max_size         = 10
    min_size         = 2

  }
  catalogue = {
    name             = "catalogue"
    instance_type    = "t3.small"
    subnet_name      = "app"
    allow_app_cidr   = "web"
    desired_capacity = 2
    max_size         = 10
    min_size         = 2
  }
  #  cart = {
  #    name          = "cart"
  #    instance_type ="t3.micro"
  #    subnet_name   = "app"
  #  }
  #  user = {
  #    name          = "user"
  #    instance_type ="t3.micro"
  #    subnet_name   = "app"
  #  }
  #  shipping = {
  #    name          = "shipping"
  #    instance_type ="t3.micro"
  #    subnet_name   = "app"
  #  }
  #  payment= {
  #    name          = "payment"
  #    instance_type ="t3.micro"
  #    subnet_name   = "app"
  #  }
  #}
}
  docdb = {
    main = {
      subnet_name    = "db"
      allow_db_cidr  = "app"
      engine_version = "4.0.0"
      instance_count = 1
      instance_class = "db.t3.medium"
    }
  }

rds = {
  main = {
    subnet_name    = "db"
    allow_db_cidr  = "app"
    engine_version = "5.7.mysql_aurora.2.11.2"
    instance_count = 1
    instance_class = "db.t3.small"
  }
}

elasticache = {
  main = {
    subnet_name    = "db"
    allow_db_cidr  = "app"
    engine_version = "6.x"
    replicas_per_node_group =1
    num_node_groups =1
    node_type = "cache.t3.micro"
  }
}
rabbitmq = {
  main = {
    subnet_name    = "db"
    allow_db_cidr  = "app"
    instance_type = "t3.small"
  }
}

alb ={
  public = {
    name ="'public"
    subnet_name = "public"
    allow_alb_cidr = null
    internal = false
}
  private = {
    name ="'private"
    subnet_name = "private"
    allow_alb_cidr = "web"
    internal = true
  }
}